import 'package:ambar_test/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenView extends StatefulWidget {
  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  double animValue = 0;

  void functionAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
          mounted ? animationController.forward() : DoNothingAction();
        }
      },
    );

    animationController.addListener(
      () {
        setState(
          () {
            animValue = animationController.value;
          },
        );
      },
    );

    animationController.forward();
  }

  @override
  void initState() {
    super.initState();
    functionAnimation();
  }

  @override
  void dispose() {
    if (animationController.status == AnimationStatus.forward ||
        animationController.status == AnimationStatus.dismissed) {
      animationController.notifyStatusListeners(AnimationStatus.dismissed);
    }
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SplashScreen(
            backgroundColor: Colors.indigo[600],
            seconds: 1,
            navigateAfterSeconds: Routes.HOME,
            routeName: "/splash",
            loaderColor: Colors.transparent,
          ),
          Center(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 700),
              opacity: animValue,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Lottie.asset('assets/animations/splash_anim.json'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
