import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GitlabRepositoryList extends StatelessWidget {
  List<dynamic> respoitories;
  Function(String, String) callback;
  GitlabRepositoryList(this.respoitories, this.callback);

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
                title: Text(respoitories[index]["name"],
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                subtitle: Text(respoitories[index]["owner"]["username"]),
                leading: Image.network(
                    this.respoitories[index]["owner"]["avatar_url"]),
                onTap: () => {
                  callback(respoitories[index]["id"].toString(),
                      respoitories[index]["owner"]["username"])
                },
              );
            },
          ))
    ]));
  }
}
