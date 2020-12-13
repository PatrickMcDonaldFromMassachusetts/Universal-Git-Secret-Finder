import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FileList extends StatelessWidget {
  List<dynamic> files;
  Function(dynamic) callback;
  FileList(this.files, this.callback);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flexible(
        flex: 1,
        child: ListView.builder(
          itemCount: this.files.length,
          itemBuilder: (BuildContext context, int index) {
            var item = files[index];
            return ListTile(
              onTap: () => this.callback(item),
              title: Text(item.path,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text(item.branch),
            );
          },
        ));
  }
}
