import 'package:ambar_test/app/utils/api_utils/endpoints/home_endpoints/git_endpoints.dart';
import 'package:ambar_test/app/utils/api_utils/headers/headers.dart';
import 'package:ambar_test/app/utils/api_utils/requester/requester.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class HomeProvider {
  final http.Client httpClient;
  HomeProvider({@required this.httpClient});

  getRepos() async {
    var response = await Requester().fetch(
        url: GitEndpoints.publicRepos(), header: Headers.getBasicHeader());
    return response;
  }
}
