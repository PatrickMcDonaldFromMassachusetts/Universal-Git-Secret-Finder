import 'package:flutter/material.dart';
import 'package:universal_git_scanner/components/Drawer.dart';
import 'package:universal_git_scanner/clients/githubClient.dart';
import 'package:universal_git_scanner/components/FileList.dart';
import 'package:universal_git_scanner/components/GithubRepositoryList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_git_scanner/models/gitFile.dart';
import 'package:universal_git_scanner/pages/github/mobile/gitlab/GitlabFileContent.dart';
import 'package:universal_git_scanner/utilities/cryptoScanners.dart';

import 'GithubFileContent.dart';

class GithubMobileScanner extends StatefulWidget {
  String owner;
  String name;
  GithubMobileScanner(this.owner, this.name);
  GithubMobileScannerState createState() =>
      GithubMobileScannerState(this.owner, this.name);
}

class GithubMobileScannerState extends State {
  List<gitFile> filesWithCrypto = new List<gitFile>();
  GithubClient client;
  String owner;
  String name;
  List<gitFile> filesWithSecrets = new List<gitFile>();

  bool startScanning = false;

  bool scanning = false;

  int numberOfFiles = 0;

  var numberOfFileScanned = 0;
  GithubMobileScannerState(this.owner, this.name);
  void scanRepository() async {
    this.startScanning = true;
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

  void goToFile(dynamic file) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: AppDrawer(),
        body: Column(children: [
          Text("Files with secrets",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          FutureBuilder<SharedPreferences>(
              future: SharedPreferences.getInstance(),
              builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
                if (snapshot.hasData) {
                  SharedPreferences sharedPreferences = snapshot.data;
                  String githubApiKey =
                      "7c4e4551e6ead457a962c7ac04807f614ece89de"; //sharedPreferences.getString("githubApiKey");
                  client = new GithubClient(githubApiKey);
                  if (!startScanning) {
                    scanRepository();
                  }
                  return FileList(filesWithSecrets, selectFile);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
        ]));
  }

  void selectFile(dynamic file) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GithubFileContents(owner, name, file.branch, file.path)));
  }
}
