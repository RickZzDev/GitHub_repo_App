import 'package:get/get.dart';

import 'package:ambar_test/app/bindings/home_binding/home_binding.dart';
import 'package:ambar_test/app/routes/app_routes.dart';
import 'package:ambar_test/app/ui/pages/pages.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASHSCREEEN,
      page: () => SplashScreenView(),
    ),
    GetPage(
      name: Routes.HOME,
      binding: HomeBinding(),
      // transition: Transition.cupertino,
      page: () => HomeView(),
    )
  ];
}
