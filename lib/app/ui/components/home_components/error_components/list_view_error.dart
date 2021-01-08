import 'package:ambar_test/app/utils/styles_utils/styles_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class ListViewError extends StatelessWidget {
  const ListViewError({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      padding: EdgeInsets.only(top: screenHeigthSize * 0.2),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 4, top: 2),
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Center(
            child: Lottie.asset("assets/animations/error.json"),
          ),
        );
      },
    );
  }
}
