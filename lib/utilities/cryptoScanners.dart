import 'package:universal_git_scanner/models/MatchTypePairs.dart';

import "cryptoSigntures.dart";

bool scanFileForSecrets(String path, String content) {
  return scanContentForSecrets(content) ||
      scanPathForSecrets(path) ||
      scanExtensionForSecrets(path) ||
      scanNameForSecrets(path);
}

bool scanContentForSecrets(String content) {
  var signiture2 = signitures().signiture;
  String a;
  for (int index = 0; index < signiture2.length; index++) {
    try {
      Map<String, String> signiture = signiture2[index];
      a = signiture["name"];
      if (signiture["part"] == "contents") {
        RegExp re = new RegExp(signiture["regex"]);
        if (re.hasMatch(content)) {
          return true;
        }
      }
    } catch (e) {
      print("crypto error ${a} ${e}");
      continue;
    }
  }
  return false;
}

bool scanPathForSecrets(String path) {
  String a;
  var signiture2 = signitures().signiture;
  for (int index = 0; index < signiture2.length; index++) {
    try {
      Map<String, String> signiture = signiture2[index];
      a = signiture["name"];
      if (signiture["part"] == "path") {
        RegExp re = new RegExp(signiture["regex"]);
        if (re.hasMatch(path)) {
          return true;
        }
      }
    } catch (e) {
      print("crypto error ${a} ${e}");
      continue;
    }
  }
  return false;
}

bool scanExtensionForSecrets(String path) {
  String a;
  var signiture2 = signitures().signiture;
  for (int index = 0; index < signiture2.length; index++) {
    try {
      Map<String, String> signiture = signiture2[index];
      if (signiture["part"] == "extension") {
        var split = path.split(".");
        String fileextension = split[split.length - 1];
        RegExp re = new RegExp(signiture["regex"]);
        if (re.hasMatch(fileextension)) {
          return true;
        }
      }
    } catch (e) {
      print("crypto error ${a} ${e}");
      continue;
    }
  }
  return false;
}

bool scanNameForSecrets(String path) {
  var signiture2 = signitures().signiture;
  for (int index = 0; index < signiture2.length; index++) {
    Map<String, String> signiture = signiture2[index];
    if (signiture["part"] == "filename") {
      RegExp re = new RegExp(signiture["regex"]);
      if (re.hasMatch(path)) {
        return true;
      }
    }
  }
  return false;
}

List<MatchTypePairs> findCryptoSubstring(String content) {
  var signiture2 = signitures().signiture;
  List<MatchTypePairs> matches = new List<MatchTypePairs>();
  for (int index = 0; index < signiture2.length; index++) {
    try {
      Map<String, String> signiture = signiture2[index];
      if (signiture["part"] == "contents") {
        RegExp re = new RegExp(signiture["regex"]);
        if (re.hasMatch(content)) {
          for (Match match in re.allMatches(content)) {
            MatchTypePairs matchType = new MatchTypePairs();
            matchType.match = match;
            matchType.name = signiture["name"];
            matches.add(matchType);
          }
        }
      }
    } catch (e) {
      continue;
    }
  }
  return matches;
}
