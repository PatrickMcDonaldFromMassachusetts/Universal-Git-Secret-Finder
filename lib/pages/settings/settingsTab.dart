import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class settings extends StatefulWidget {
  @override
  settingsState createState() => settingsState();
}

class settingsState extends State {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            SharedPreferences settings = snapshot.data;
            TextEditingController githubapi = new TextEditingController(
                text: settings.getString("githubapikey"));
            TextEditingController gitlabapi = new TextEditingController(
                text: settings.getString("gitlabapikey"));
            TextEditingController gitlabuser = new TextEditingController(
                text: settings.getString("gitlabuser"));
            return Column(
              children: <Widget>[
                Text("github api token",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                TextField(
                  controller: githubapi,
                  onChanged: (value) => githubapi.text = value,
                ),
                Text("gitlab userid (your username)",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                TextField(
                  controller: gitlabuser,
                  onChanged: (value) => gitlabuser.text = value,
                ),
                Text("gitlab api token",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                TextField(
                  controller: gitlabapi,
                  onChanged: (value) => githubapi.text = value,
                ),
                RaisedButton(
                  child: Text("submit",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  onPressed: () async {
                    print("github api key " + githubapi.text);
                    print("gitlab api key " + gitlabapi.text);
                    settings.setString("gitlabapikey", gitlabapi.text);
                    settings.setString("githubapikey", githubapi.text);
                    settings.setString("gitlabuser", gitlabuser.text);
                  },
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
