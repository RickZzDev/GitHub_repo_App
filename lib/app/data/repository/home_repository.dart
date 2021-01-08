import 'package:ambar_test/app/data/provider/home_provider.dart';
import 'package:meta/meta.dart';

class HomeRepository {
  final HomeProvider apiClient;

  HomeRepository({@required this.apiClient}) : assert(apiClient != null);

  getRepos() {
    return apiClient.getRepos();
  }
}
