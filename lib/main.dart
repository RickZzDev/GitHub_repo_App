import 'package:ambar_test/app/routes/app_pages.dart';
import 'package:ambar_test/app/routes/app_routes.dart';
import 'package:ambar_test/app/ui/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      initialRoute: Routes.SPLASHSCREEEN,
    );
  }
}
