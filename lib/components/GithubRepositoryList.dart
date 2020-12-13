import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GithubRepositoryList extends StatelessWidget {
  List<dynamic> respoitories;
  Function(String, String) callback;
  GithubRepositoryList(this.respoitories, this.callback);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        child: Column(children: [
      Text("repositories",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      Flexible(
          flex: 1,
          child: ListView.builder(
            itemCount: this.respoitories.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(respoitories[index]["name"]),
                subtitle: Text(respoitories[index]["owner"]["login"]),
                leading: Image.network(
                    this.respoitories[index]["owner"]["avatar_url"]),
                onTap: () => {
                  callback(respoitories[index]["name"],
                      respoitories[index]["owner"]["login"])
                },
              );
            },
          ))
    ]));
  }
}
