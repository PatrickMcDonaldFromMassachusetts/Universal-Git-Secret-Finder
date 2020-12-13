import 'package:flutter/material.dart';
import 'package:universal_git_scanner/components/Drawer.dart';
import 'package:universal_git_scanner/clients/githubClient.dart';
import 'package:universal_git_scanner/components/FileContents.dart';
import 'package:universal_git_scanner/components/FileList.dart';
import 'package:universal_git_scanner/components/GithubRepositoryList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_git_scanner/utilities/cryptoScanners.dart';

class GithubFileContents extends StatefulWidget {
  String owner;
  String name;
  String branch;
  String path;
  GithubFileContents(this.owner, this.name, this.branch, this.path);
  GithubFileContentsState createState() =>
      GithubFileContentsState(this.owner, this.name, this.branch, this.path);
}

class GithubFileContentsState extends State {
  List<dynamic> filesWithCrypto = new List<dynamic>();
  GithubClient client;
  String owner;
  String name;
  String branch;
  String path;
  GithubFileContentsState(this.owner, this.name, this.branch, this.path);
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
              String githubApiKey =
                  "7c4e4551e6ead457a962c7ac04807f614ece89de"; //sharedPreferences.getString("githubApiKey");
              client = new GithubClient(githubApiKey);
              return Column(children: [
                FutureBuilder<dynamic>(
                    future: client.getRepositoryObject(
                        this.owner, this.name, path, branch),
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
