// class GitRepoResponse {
//   List<GitRepoModel> repos = [];
// }

class GitRepoModel {
  String name;
  Owner owner;
  String htmlUrl;
  List<GitRepoModel> repos = [];

  GitRepoModel({
    this.name,
    this.owner,
    this.htmlUrl,
  });

  List<GitRepoModel> fromJson(List<dynamic> list) {
    for (var repo in list) {
      repos.add(
        GitRepoModel(
            name: repo['name'],
            htmlUrl: repo['html_url'],
            owner:
                repo['owner'] != null ? Owner.fromJson(repo['owner']) : null),
      );
    }
    return repos;
  }

  // GitRepoModel.fromJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //   htmlUrl = json['html_url'];
  //   owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
  // }
}

class Owner {
  String login;

  String avatarUrl;

  String url;
  String htmlUrl;

  Owner({
    this.login,
    this.avatarUrl,
    this.url,
    this.htmlUrl,
  });

  Owner.fromJson(Map<String, dynamic> json) {
    login = json['login'];

    avatarUrl = json['avatar_url'];

    htmlUrl = json['html_url'];
  }
}
