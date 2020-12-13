import 'package:flutter/material.dart';
import 'package:universal_git_scanner/components/Drawer.dart';
import 'package:universal_git_scanner/clients/githubClient.dart';
import 'package:universal_git_scanner/components/GithubRepositoryList.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_git_scanner/components/GitlabRepositoryList.dart';
import 'package:universal_git_scanner/pages/github/mobile/gitlab/GitlabRepositoryScanner.dart';

import 'GithubRepositoryScanner.dart';

class GithubMobileRepositoryList extends StatefulWidget {
  GithubMobileRepositoryListState createState() =>
      GithubMobileRepositoryListState();
}

class GithubMobileRepositoryListState extends State {
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
              GithubClient client = new GithubClient(githubApiKey);
              print("api key${githubApiKey}");
              return FutureBuilder(
                future: client.getRepositoire(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                        children: [GithubRepositoryList(snapshot.data, Scan)]);
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
        ));
  }

  void Scan(String name, String owner) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GithubMobileScanner(owner, name)));
  }
}
