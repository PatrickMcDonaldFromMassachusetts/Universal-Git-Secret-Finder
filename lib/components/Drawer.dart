import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_git_scanner/pages/github/mobile/github/RepositoryList.dart';
import 'package:universal_git_scanner/pages/github/mobile/gitlab/RepositoryList.dart';
import 'package:universal_git_scanner/pages/settings/settingsPage.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(Object context) {
    // TODO: implement build
    return Drawer(
        child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text(
            'Universal Git  Scanner',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.github),
          title: Text('github'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GithubMobileRepositoryList()));
          },
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.gitlab),
          title: Text('gitlab'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GitlabMobileRepositoryList()));
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('settings'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsPage()));
          },
        ),
      ],
    ));
  }
}
