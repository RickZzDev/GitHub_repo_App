import 'package:ambar_test/app/ui/components/home_components/shimmers/home_header_shimmer.dart';
import 'package:ambar_test/app/ui/components/home_components/shimmers/list_view_shimmer.dart';
import 'package:ambar_test/app/utils/styles_utils/styles_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeHeaderShimmer(),
        Container(
          // curve: Curves.easeIn,
          width: MediaQuery.of(context).size.width,
          height: screenHeigthSize * 0.75,
          // height: MediaQuery.of(context).size.height * 0.2,
          padding: EdgeInsets.only(left: 16, right: 16, top: 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: ListViewShimmer(),
        ),
      ],
    );
  }
}
