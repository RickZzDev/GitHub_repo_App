import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(104, 203, 60, .1),
  100: Color.fromRGBO(104, 203, 60, .2),
  200: Color.fromRGBO(104, 203, 60, .3),
  300: Color.fromRGBO(104, 203, 60, .4),
  400: Color.fromRGBO(104, 203, 60, .5),
  500: Color.fromRGBO(104, 203, 60, .6),
  600: Color.fromRGBO(104, 203, 60, .7),
  700: Color.fromRGBO(104, 203, 60, .8),
  800: Color.fromRGBO(104, 203, 60, .9),
  900: Color.fromRGBO(104, 203, 60, 1),
};

MaterialColor primaryColor = MaterialColor(0xFF0073ff, color);
final ThemeData appThemeData = ThemeData(
  primarySwatch: primaryColor,
  primaryColor: primaryColor,
  buttonColor: primaryColor,
  brightness: Brightness.light,
  accentColor: Colors.blueAccent[400],
  // appBarTheme: AppBarTheme(color: Colors.green),
);
