// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:ambar_test/app/data/provider/home_provider.dart';
import 'package:ambar_test/app/data/repository/home_repository.dart';
import 'package:ambar_test/app/utils/api_utils/headers/headers.dart';
import 'package:ambar_test/app/utils/api_utils/requester/requester.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class HttpClientSpy extends Mock implements Requester {}

void main() {
  Requester httpClient;
  String url;
  HomeProvider homeProvider;
  HomeRepository homeRepository;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    homeProvider = HomeProvider(requester: httpClient);
    homeRepository = HomeRepository(apiClient: homeProvider);
  });

  test(
    "Should call httpClient with corect values",
    () async {
      //Action
      await httpClient.fetch(url: url);
      //Assert
      verify(
        httpClient.fetch(
          url: url,
        ),
      );
    },
  );

  test(
    "Should call HomeProvider that will call a requester with correct values",
    () async {
      await homeProvider.getRepos();
      verify(
        httpClient.fetch(
          url: "https://api.github.com/repositories",
          header: Headers.getBasicHeader(),
        ),
      );
    },
  );

  test(
    "Should call HomeRepository that will call a HomeProvider",
    () async {
      await homeRepository.getRepos();
      verify(
        homeProvider.getRepos(),
      );
    },
  );
}
