import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ambar_test/app/controllers/home_controller/home_controller.dart';
import 'package:ambar_test/app/ui/components/home_components/home_components.dart';
import 'package:ambar_test/app/utils/styles_utils/styles_utils.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double heigth = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController _controller = Get.find<HomeController>();
    Future<double> height = Future<double>.value(screenHeigthSize * 0.75);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Obx(
          () => RefreshIndicator(
            onRefresh: () => _controller.refreshpage(),
            child: FutureBuilder(
              future: _controller.repoResponse.value,
              builder: (context, snapshotRequest) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _controller.verifyConnectionAndError(snapshotRequest)
                        // snapshotRequest.connectionState == ConnectionState.done &&
                        //         !snapshotRequest.hasError
                        ? HomeHeader()
                        : _controller.verifyErrorAndLoading(snapshotRequest)
                            ? HomeHeaderShimmer()
                            : HomeHeaderError(),
                    FutureBuilder(
                      future: height,
                      initialData: 0.0,
                      builder: (context, snapshot) => AnimatedContainer(
                        duration: Duration(milliseconds: 1000),
                        // curve: Curves.easeIn,
                        width: MediaQuery.of(context).size.width,
                        height: snapshot.data,
                        padding: EdgeInsets.only(left: 16, right: 16, top: 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: _controller
                                .verifyConnectionAndError(snapshotRequest)
                            ? ListViewRepo(
                                controller: _controller,
                              )
                            : _controller.verifyErrorAndLoading(snapshotRequest)
                                ? ListViewShimmer()
                                : ListViewError(),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
