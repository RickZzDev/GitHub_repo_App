import 'package:ambar_test/app/data/provider/home_provider.dart';
import 'package:meta/meta.dart';

class HomeRepository {
  final HomeProvider apiClient;

  HomeRepository({@required this.apiClient}) : assert(apiClient != null);

  getRepos() {
    //Descomente essa linha e comente a de baixo para ver o comportamento da teal ao receber uma Exception
    // return throw Exception();
    return apiClient.getRepos();
  }
}
