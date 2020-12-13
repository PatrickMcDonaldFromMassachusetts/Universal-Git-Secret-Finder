import 'package:flutter/material.dart';
import 'package:universal_git_scanner/clients/gitlabClient.dart';
import 'package:universal_git_scanner/components/Drawer.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_git_scanner/components/GithubRepositoryList.dart';
import 'package:universal_git_scanner/components/GitlabRepositoryList.dart';

import 'GitlabRepositoryScanner.dart';

class GitlabMobileRepositoryList extends StatefulWidget {
  GitlabMobileRepositoryListState createState() =>
      GitlabMobileRepositoryListState();
}

class GitlabMobileRepositoryListState extends State {
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
              GitlabClient client =
                  new GitlabClient(GitlabApiKey, gitlabuserid);
              print("api key${GitlabApiKey}");
              return FutureBuilder(
                future: client.getRepositoire(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                        children: [GitlabRepositoryList(snapshot.data, Scan)]);
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
            builder: (context) => GitlabMobileScanner(owner, name)));
  }
}
