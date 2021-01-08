import 'package:ambar_test/app/utils/my_anim_package/chat_automatic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      // padding: EdgeInsets.only(top: 4),
      decoration: BoxDecoration(),
      child: Container(
        child: ChatAnimatedMessage(
          message: "Hello\nThe first houndred gitHub repositories. Enjoy!",
          timeToStart: 1,
          baloonColor: Colors.transparent,
          roundedBorder: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
