import 'dart:convert';

import 'package:ambar_test/app/data/models/git_repo_model.dart';
import 'package:ambar_test/app/data/repository/home_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  HomeController({@required this.repository}) : assert(repository != null);
  RxList<GitRepoModel> repos = <GitRepoModel>[].obs;
  Future<RxList<GitRepoModel>> reposFuture = Future.value(<GitRepoModel>[].obs);
  Rx<Future> repoResponse = Rx<Future>();

  final loading = false.obs;
  @override
  void onReady() {
    repoResponse.value = getGitRepos();
    super.onReady();
  }

  Future<void> refreshpage() async {
    repoResponse.value = getGitRepos();
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<dynamic> getGitRepos() async {
    loading.value = true;
    try {
      var response = await repository.getRepos();

      List<dynamic> _list = json.decode(
        utf8.decode(response.bodyBytes),
      );

      repos.addAll(GitRepoModel().fromJson(_list));
    } catch (e) {
      loading.value = false;
      return Future.error(e);
    }
  }

  bool verifyConnectionAndError(AsyncSnapshot _snapshot) {
    if (_snapshot.connectionState == ConnectionState.done &&
        !_snapshot.hasError)
      return true;
    else
      return false;
  }

  bool verifyErrorAndLoading(AsyncSnapshot _snapshot) {
    if (!_snapshot.hasError || loading.value)
      return true;
    else
      return false;
  }

  goRepoPage(String _url) async {
    if (await canLaunch(_url))
      await launch(_url);
    else
      throw "Could not launch $_url";
  }
}
