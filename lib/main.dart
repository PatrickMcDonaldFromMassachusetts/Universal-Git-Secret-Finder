import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:universal_git_scanner/layouts/tabbedlayout.dart';
import 'package:universal_git_scanner/pages/github/mobile/github/RepositoryList.dart';
import 'package:universal_git_scanner/pages/github/mobile/gitlab/RepositoryList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BasePage());
  }
}

class BasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid || Platform.isIOS) {
      return Mobile();
    } else if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      return Desktop();
    }
  }
}

class Mobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width2 = MediaQuery.of(context).size.width;
    if (width2 < 500) {
      return GithubMobileRepositoryList();
    } else {
      return TabbedLayout();
    }
  }
}

class Desktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabbedLayout();
  }
}
