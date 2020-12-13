import 'package:dio/dio.dart';

class GitlabClient {
  String githubAuthToken;
  String userid;
  GitlabClient(this.githubAuthToken, this.userid);

  Future<List<dynamic>> getRepositoire() async {
    try {
      Dio dio = new Dio();
      Response response = await dio.get(
          "https://gitlab.com/api/v4/users/${this.userid}/projects?private_token=${this.githubAuthToken}",
          options: Options(
            headers: {
              "Accept": "application/json",
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
          "https://gitlab.com/api/v4/projects/${name}/repository/branches?private_token=${this.githubAuthToken}",
          options: Options(
            headers: {
              "Accept": "application/json",
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
      String owner, String name, String id, String branch) async {
    try {
      Dio dio = new Dio();
      print(
          "https://gitlab.com/api/v4/projects/${name}/repository/blobs/$id/raw?private_token=${this.githubAuthToken}&ref=${branch}&per_page=300");
      Response response = await dio.get(
          "https://gitlab.com/api/v4/projects/${name}/repository/blobs/$id/raw?private_token=${this.githubAuthToken}&ref=${branch}&per_page=300",
          options: Options(headers: {
            "Accept": "application/json",
          }));
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
    print(
        "https://gitlab.com/api/v4/projects/$name/repository/tree?private_token=${this.githubAuthToken}&ref=${branch}&per_page=300&path=${path}");

    Response response = await dio.get(
        "https://gitlab.com/api/v4/projects/$name/repository/tree?private_token=${this.githubAuthToken}&ref=${branch}&per_page=300&path=${path}",
        options: Options(headers: {
          "Accept": "application/json",
        }));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }

  Future<List<dynamic>> getRootRepositoryDir(
      String owner, String name, String path, String branch) async {
    Dio dio = new Dio();
    print(
        "https://gitlab.com/api/v4/projects/$name/repository/tree?private_token=${this.githubAuthToken}&ref=${branch}&per_page=300");

    Response response = await dio.get(
        "https://gitlab.com/api/v4/projects/$name/repository/tree?private_token=${this.githubAuthToken}&ref=${branch}&per_page=300",
        options: Options(headers: {
          "Accept": "application/json",
        }));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }
}
