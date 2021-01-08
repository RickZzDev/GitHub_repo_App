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
import 'package:ambar_test/app/utils/api_utils/headers/headers.dart';
import 'package:ambar_test/app/utils/api_utils/requester/requester.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class ControllerSpy extends Mock implements HomeController {}

class HttpClientSpy extends Mock implements Requester {}

void main() {
  Requester httpClient;
  // String url;
  HomeProvider homeProvider;
  HomeRepository homeRepository;
  HomeController _controller;

  setUp(() {
    httpClient = HttpClientSpy();
    homeProvider = HomeProvider(requester: httpClient);
    homeRepository = HomeRepository(apiClient: homeProvider);
    _controller = HomeController(repository: homeRepository);

    //Criamos uma url fake com o Faker
    // url = faker.internet.httpUrl();
  });

  test(
    "Verify all initial variables value",
    () async {
      RxList<GitRepoModel> _repos = <GitRepoModel>[].obs;
      Future<RxList<GitRepoModel>> _reposFuture =
          Future.value(<GitRepoModel>[].obs);
      Rx<Future> _repoResponse = Rx<Future>();
      RxBool _value = false.obs;
      expect(_controller.loading, _value);
      expect(_controller.repos, _repos);
    },
  );
}
