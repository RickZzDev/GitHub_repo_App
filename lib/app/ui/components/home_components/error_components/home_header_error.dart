import 'package:ambar_test/app/utils/my_anim_package/chat_automatic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeHeaderError extends StatelessWidget {
  const HomeHeaderError({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Container(
        child: ChatAnimatedMessage(
          message:
              "Oh no, Oh no. Something went wrong, please give me a pull to refresh!",
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
