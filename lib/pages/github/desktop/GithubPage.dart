import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_git_scanner/clients/githubClient.dart';
import 'package:universal_git_scanner/components/FileContents.dart';
import 'package:universal_git_scanner/components/FileList.dart';
import 'package:universal_git_scanner/components/GithubRepositoryList.dart';
import 'package:universal_git_scanner/models/gitFile.dart';
import 'package:universal_git_scanner/utilities/cryptoScanners.dart';

class GithubPage extends StatefulWidget {
  @override
  GithubPageState createState() => GithubPageState();
}

class GithubPageState extends State {
  dynamic repositoryToBeScanned;
  GithubClient client;
  List<gitFile> filesWithSecrets = new List<gitFile>();
  gitFile selectedFile;
  String name;

  String owner;

  bool scanning = false;
  bool startScanning = false;
  int numberOfFiles = 1;

  var numberOfFileScanned = 1;
  void scanRepository() async {
    this.scanning = true;
    List<dynamic> files = new List<dynamic>();
    List<dynamic> branches = await client.getRepositoiryBranches(owner, name);
    for (int branchindex = 0; branchindex < branches.length; branchindex++) {
      dynamic branch = branches[branchindex];
      files =
          await client.getRepositoryObject(owner, name, "/", branch["name"]);
      for (int fileindex = 0; fileindex < files.length; fileindex++) {
        dynamic file = files[fileindex];
        print("processing ${branch["name"]} ${file["path"]}");
        print("file type ${file["type"]}");
        if (file["type"] == "dir") {
          files.addAll(await client.getRepositoryDir(
              owner, name, file["path"], branch["name"]));
        } else {
          scanFile(
              await client.getRepositoryObject(
                  owner, name, file["path"], branch["name"]),
              file["path"],
              branch["name"]);
        }
        this.setState(() {
          numberOfFiles = files.length;
          numberOfFileScanned = numberOfFileScanned + 1;
        });
      }
    }
    this.setState(() {
      this.name = name;
      this.startScanning = false;
      scanning = false;
    });
  }

  void scanFile(dynamic file, String path, String branch) async {
    print("file results ${file}");

    if (scanFileForSecrets(path, file)) {
      print("file results ${path} has secrets");
      gitFile gitfile = new gitFile();
      gitfile.path = path;
      gitfile.branch = branch;
      gitfile.repository = name;

      gitfile.owner = owner;
      filesWithSecrets.add(gitfile);
      this.setState(() {
        filesWithSecrets = filesWithSecrets;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!scanning && this.startScanning) {
      print("scanning repository");
      scanRepository();
    }
    // TODO: implement build
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.hasData) {
          SharedPreferences sharedPreferences = snapshot.data;
          String githubApiKey = sharedPreferences.getString("githubapikey");
          client = new GithubClient(githubApiKey);
          print("api key${githubApiKey}");
          return FutureBuilder(
            future: client.getRepositoire(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data.length);
                return Row(
                  children: [
                    GithubRepositoryList(snapshot.data, selectRepository),
                    Flexible(
                        flex: 1,
                        child: Column(children: [
                          Text("Files with secrets",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          (scanning
                              ? LinearProgressIndicator(
                                  value: numberOfFiles / numberOfFileScanned,
                                )
                              : Text("not scanning",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          FileList(filesWithSecrets, selectFile)
                        ])),
                    selectedFile != null
                        ? FutureBuilder<dynamic>(
                            future: client.getRepositoryObject(
                                selectedFile.owner,
                                selectedFile.repository,
                                selectedFile.path,
                                selectedFile.branch),
                            builder:
                                (context, AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.hasData) {
                                return Flexible(
                                    flex: 2,
                                    child: FileContents(selectedFile.branch,
                                        selectedFile.path, snapshot.data));
                              } else {
                                return Flexible(
                                    flex: 2,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ));
                              }
                            })
                        : Flexible(
                            flex: 2,
                            child: Center(
                                child: Text("no file selected",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))))
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  void selectFile(dynamic file) {
    this.setState(() {
      this.selectedFile = file;
    });
  }

  void selectRepository(String name, String owner) {
    print("selected ${name}, by ${owner}");
    this.setState(() {
      this.name = name;
      this.owner = owner;
      this.startScanning = true;
    });
  }
}
