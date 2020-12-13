import 'package:flutter/material.dart';
import 'package:universal_git_scanner/clients/gitlabClient.dart';
import 'package:universal_git_scanner/components/Drawer.dart';
import 'package:universal_git_scanner/components/FileList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_git_scanner/models/gitFile.dart';
import 'package:universal_git_scanner/utilities/cryptoScanners.dart';

import 'GitlabFileContent.dart';

class GitlabMobileScanner extends StatefulWidget {
  String owner;
  String name;
  GitlabMobileScanner(this.owner, this.name);
  GitlabMobileScannerState createState() =>
      GitlabMobileScannerState(this.owner, this.name);
}

class GitlabMobileScannerState extends State {
  List<gitFile> filesWithCrypto = new List<gitFile>();
  GitlabClient client;
  String owner;
  String name;
  List<gitFile> filesWithSecrets = new List<gitFile>();
  bool startScanning = false;

  bool scanning = false;

  int numberOfFiles = 0;

  var numberOfFileScanned = 0;
  GitlabMobileScannerState(this.owner, this.name);
  void scanRepository() async {
    this.startScanning = true;
    List<dynamic> files = new List<dynamic>();
    List<dynamic> branches = await client.getRepositoiryBranches(owner, name);
    for (int branchindex = 0; branchindex < branches.length; branchindex++) {
      dynamic branch = branches[branchindex];
      files =
          await client.getRootRepositoryDir(owner, name, "", branch["name"]);
      for (int fileindex = 0; fileindex < files.length; fileindex++) {
        dynamic file = files[fileindex];
        print("processing ${branch["name"]} ${file["path"]}");
        print("file type ${file["type"]}");
        if (file["type"] == "tree") {
          files.addAll(await client.getRepositoryDir(
              owner, name, file["path"], branch["name"]));
        } else {
          scanFile(
              await client.getRepositoryObject(
                  owner, name, file["id"], branch["name"]),
              file["id"],
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

  void scanFile(dynamic file, String path, String id, String branch) async {
    print("file results ${file}");

    if (scanFileForSecrets(path, file)) {
      print("file results ${path} has secrets");
      gitFile gitfile = new gitFile();
      gitfile.path = path;
      gitfile.branch = branch;
      gitfile.id = id;
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
                  String GitlabApiKey =
                      "HpVUyknH6ZJXM9zx4yVx"; //sharedPreferences.getString("GitlabApiKey");
                  String gitlabuserid =
                      "Patrick_McDonald"; //sharedPreferences.getString("gitlabuser");
                  client = new GitlabClient(GitlabApiKey, gitlabuserid);
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
            builder: (context) => GitlabFileContents(
                owner, name, file.branch, file.path, file.id)));
  }
}
