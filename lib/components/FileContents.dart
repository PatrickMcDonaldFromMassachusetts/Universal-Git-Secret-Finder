import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_git_scanner/models/MatchTypePairs.dart';
import 'package:universal_git_scanner/utilities/cryptoScanners.dart';

class FileContents extends StatelessWidget {
  String content;

  String branch;
  String owner;
  String repository;
  String path;
  FileContents(this.branch, this.path, this.content);

  @override
  Widget build(BuildContext context) {
    List<String> lines = this.content.split("\n");
    var branch;
    return Column(children: [
      Text(this.path,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      Text(this.branch,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      Expanded(
          child: ListView.builder(
              itemCount: lines.length,
              itemBuilder: (BuildContext context, int index) {
                print("line content ${lines[index]}");
                var secretMatches = findCryptoSubstring(lines[index]);
                if (secretMatches.length > 0) {
                  String line = lines[index];
                  var startOfLine =
                      line.substring(0, secretMatches[0].match.start);
                  var testSpans = List<TextSpan>();
                  var secretTypes = "";
                  for (MatchTypePairs match in secretMatches) {
                    secretTypes = "$secretTypes ${match.name}";
                    var span =
                        line.substring(match.match.start, match.match.end);
                    testSpans.add(TextSpan(
                        text: span,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            backgroundColor: Colors.red)));
                  }
                  testSpans.add(TextSpan(
                      text: line.substring(
                          secretMatches[secretMatches.length - 1].match.end)));
                  return ListTile(
                    title: RichText(
                      text: TextSpan(
                        text: startOfLine,
                        style: DefaultTextStyle.of(context).style,
                        children: testSpans,
                      ),
                    ),
                    subtitle: Text(
                      secretTypes,
                      style: TextStyle(
                          backgroundColor: Colors.yellow,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                } else {
                  return ListTile(title: Text(lines[index]));
                }
              }))
    ]);
  }
}
