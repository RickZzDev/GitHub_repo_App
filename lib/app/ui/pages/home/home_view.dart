import 'package:ambar_test/app/controllers/home_controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController _controller = Get.find<HomeController>();
    return Scaffold(
      // ignore: invalid_use_of_protected_member
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Obx(
          () => FutureBuilder(
            future: Future.wait([_controller.hasCompleteGitRequest.value]),
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return Text(
                  "DATA",
                );
              else
                return Text("LOAding");
            },
          ),
        ),
      ),
    );
  }
}
