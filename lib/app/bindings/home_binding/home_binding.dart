import 'package:ambar_test/app/controllers/home_controller/home_controller.dart';
import 'package:ambar_test/app/data/provider/home_provider.dart';
import 'package:ambar_test/app/data/repository/home_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    http.Client client = http.Client();
    HomeProvider _apiClient = HomeProvider(httpClient: client);
    Get.lazyPut<HomeController>(
      () => HomeController(
        repository: HomeRepository(apiClient: _apiClient),
      ),
    );
  }
}