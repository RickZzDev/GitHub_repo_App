import 'dart:convert';

import 'package:ambar_test/app/data/models/git_repo_model.dart';
import 'package:ambar_test/app/data/repository/home_repository.dart';
import 'package:ambar_test/app/utils/api_utils/exception_utils/exception_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  HomeController({@required this.repository}) : assert(repository != null);
  RxList<GitRepoModel> repos = <GitRepoModel>[].obs;
  Future<RxList<GitRepoModel>> reposFuture = Future.value(<GitRepoModel>[].obs);
  Rx<Future<bool>> hasCompleteGitRequest = Future.value(false).obs;

  @override
  void onReady() {
    getGitRepos();
    super.onReady();
  }

  Future getGitRepos() async {
    var response = await repository.getRepos();

    List<dynamic> _list = json.decode(
      utf8.decode(response.bodyBytes),
    );

    if (ExceptionUtils.verifyIfIsException(response))
      DoNothingAction();
    else {
      repos.addAll(GitRepoModel().fromJson(_list));
      hasCompleteGitRequest.value = Future.value(true);
    }
  }
}
