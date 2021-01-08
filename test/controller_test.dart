// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:ambar_test/app/controllers/home_controller/home_controller.dart';
import 'package:ambar_test/app/data/models/git_repo_model.dart';
import 'package:ambar_test/app/data/provider/home_provider.dart';
import 'package:ambar_test/app/data/repository/home_repository.dart';
import 'package:ambar_test/app/utils/api_utils/requester/requester.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  Requester httpClient;
  HomeProvider homeProvider;
  HomeRepository homeRepository;
  HomeController _controller;

  setUp(() {
    httpClient = Requester();
    homeProvider = HomeProvider(requester: httpClient);
    homeRepository = HomeRepository(apiClient: homeProvider);
    _controller = HomeController(repository: homeRepository);
  });

  test(
    "Verify all initial variables value",
    () async {
      RxList<GitRepoModel> _repos = <GitRepoModel>[].obs;
      RxBool _value = false.obs;
      Rx<Future> _repoResponse = Rx<Future>();

      expect(_controller.loading, _value);
      expect(_controller.repos, _repos);
      expect(_controller.repoResponse, _repoResponse);
    },
  );

  test(
    "Verify if loading turns true when call api service",
    () async {
      await _controller.getGitRepos();
      RxBool _value = true.obs;
      expect(_controller.loading, _value);
    },
  );

  test(
    "Verify length of repos ",
    () async {
      await _controller.getGitRepos();
      expect(_controller.repos.length, 100);
    },
  );

  test(
    "Verify if method of validation is ok",
    () {
      AsyncSnapshot _asyncNothing = AsyncSnapshot.nothing();
      var response = _controller.verifyConnectionAndError(_asyncNothing);
      expect(response, false);

      AsyncSnapshot _asyncDone =
          AsyncSnapshot.withData(ConnectionState.done, "DATA");
      var responseDone = _controller.verifyConnectionAndError(_asyncDone);
      expect(responseDone, true);

      AsyncSnapshot _asyncError =
          AsyncSnapshot.withError(ConnectionState.done, "Erro");
      var responseError = _controller.verifyConnectionAndError(_asyncError);
      expect(responseError, false);
    },
  );
}
