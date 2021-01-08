import 'package:ambar_test/app/controllers/home_controller/home_controller.dart';
import 'package:ambar_test/app/data/provider/home_provider.dart';
import 'package:ambar_test/app/data/repository/home_repository.dart';
import 'package:ambar_test/app/utils/api_utils/requester/requester.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // http.Client client = http.Client();
    Requester requester = Requester();
    HomeProvider _apiClient = HomeProvider(requester: requester);
    Get.lazyPut<HomeController>(
      () => HomeController(
        repository: HomeRepository(apiClient: _apiClient),
      ),
    );
  }
}
