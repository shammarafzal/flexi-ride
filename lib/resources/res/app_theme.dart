import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static Color error = Colors.red[700]!;
  static const Color primaryColor = Color(0xffCAA969);
  static const Color primaryDarkColor = Color(0xff61452D);
  static final Color secondaryColor = Color(0xFF02081A);
  static final Color bgColor = Color(0xFFFFFFFF);
  static final Color whiteColor = Color(0xFFFFFFFF);
  static final Color whiteLightColor = Color(0xFFFAF8F2);
  static final Color homeBgColor = Color(0xfff7f8f9);

  static final ThemeData appThemeData = ThemeData(
    // fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: primaryColor,
    primaryColorDark: primaryDarkColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Color(0xffCAA969),
    ),
    primarySwatch: Colors.indigo,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
  );
}
