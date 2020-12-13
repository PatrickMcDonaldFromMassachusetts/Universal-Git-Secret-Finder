import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_git_scanner/pages/github/desktop/GithubPage.dart';
import 'package:universal_git_scanner/pages/github/desktop/GitlabPage.dart';
import 'package:universal_git_scanner/pages/settings/settingsTab.dart';

class TabbedLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(FontAwesomeIcons.github)),
              Tab(icon: Icon(FontAwesomeIcons.gitlab)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
        ),
        body: TabBarView(
          children: [GithubPage(), GitlabPage(), settings()],
        ),
      ),
    );
  }
}
