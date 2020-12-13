import 'package:dio/dio.dart';

class GithubClient {
  String token;
  GithubClient(this.token);

  Future<List<dynamic>> getRepositoire() async {
    try {
      Dio dio = new Dio();
      Response response = await dio.get("https://api.github.com/user/repos",
          options: Options(
            headers: {
              "Accept": "application/vnd.github.v3.raw",
              "Authorization": "Bearer " + this.token
            },
          ));
      if (response.statusCode == 200) {
        print("data");
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<dynamic>> getRepositoiryBranches(
      String owner, String name) async {
    try {
      Dio dio = new Dio();
      Response response = await dio.get(
          "https://api.github.com/repos/${owner}/${name}/branches",
          options: Options(
            headers: {
              "Accept": "application/vnd.github.v3.raw",
              "Authorization": "Bearer " + this.token
            },
          ));
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> getRepositoryObject(
      String owner, String name, String path, String branch) async {
    try {
      Dio dio = new Dio();
      print(
          "https://api.github.com/repos/${owner}/${name}/contents/${path}?ref=${branch}");
      Response response = await dio.get(
          "https://api.github.com/repos/${owner}/${name}/contents/${path}?ref=${branch}",
          options: Options(
            headers: {
              "Accept": "application/vnd.github.v3.raw",
              "Authorization": "Bearer " + this.token
            },
          ));
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<dynamic>> getRepositoryDir(
      String owner, String name, String path, String branch) async {
    Dio dio = new Dio();
    Response response = await dio.get(
        "https://api.github.com/repos/${owner}/${name}/contents/${path}?ref=${branch}",
        options: Options(
          headers: {
            "Accept": "application/vnd.github.v3.raw",
            "Authorization": "Bearer " + this.token
          },
        ));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }
}
