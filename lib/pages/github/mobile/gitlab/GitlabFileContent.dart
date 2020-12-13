import 'package:flutter/material.dart';
import 'package:universal_git_scanner/clients/gitlabClient.dart';
import 'package:universal_git_scanner/components/Drawer.dart';
import 'package:universal_git_scanner/clients/githubClient.dart';
import 'package:universal_git_scanner/components/FileContents.dart';
import 'package:universal_git_scanner/components/FileList.dart';
import 'package:universal_git_scanner/components/GithubRepositoryList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_git_scanner/utilities/cryptoScanners.dart';

class GitlabFileContents extends StatefulWidget {
  String owner;
  String name;
  String branch;
  String path;
  String id;
  GitlabFileContents(this.owner, this.name, this.branch, this.path, this.id);
  GitlabFileContentsState createState() => GitlabFileContentsState(
      this.owner, this.name, this.branch, this.path, this.id);
}

class GitlabFileContentsState extends State {
  List<dynamic> filesWithCrypto = new List<dynamic>();
  GitlabClient client;
  String owner;
  String name;
  String branch;
  String path;
  String id;
  GitlabFileContentsState(
      this.owner, this.name, this.branch, this.path, this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: AppDrawer(),
        body: FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
            if (snapshot.hasData) {
              SharedPreferences sharedPreferences = snapshot.data;
              String GitlabApiKey =
                  "HpVUyknH6ZJXM9zx4yVx"; //sharedPreferences.getString("GitlabApiKey");
              String gitlabuserid =
                  "Patrick_McDonald"; //sharedPreferences.getString("gitlabuser");
              client = new GitlabClient(GitlabApiKey, gitlabuserid);

              return Column(children: [
                FutureBuilder<dynamic>(
                    future:
                        client.getRepositoryObject(owner, name, path, branch),
                    builder: (context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return Flexible(
                            flex: 1,
                            child: FileContents(branch, path, snapshot.data));
                      } else {
                        return Flexible(
                            flex: 1,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ));
                      }
                    })
              ]);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
