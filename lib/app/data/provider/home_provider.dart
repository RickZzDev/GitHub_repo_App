import 'package:ambar_test/app/utils/api_utils/endpoints/home_endpoints/git_endpoints.dart';
import 'package:ambar_test/app/utils/api_utils/headers/headers.dart';
import 'package:ambar_test/app/utils/api_utils/requester/requester.dart';
import 'package:meta/meta.dart';

class HomeProvider {
  final Requester requester;
  HomeProvider({@required this.requester});

  getRepos() async {
    var response = await requester.fetch(
        url: GitEndpoints.publicRepos(), header: Headers.getBasicHeader());
    return response;
  }
}
