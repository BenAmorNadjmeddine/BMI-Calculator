import 'package:bmi_calculator/Shared/Styles/fonts.dart';
import 'package:bmi_calculator/Shared/Styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bmi_calculator/Shared/Styles/colors.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: font!,
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.grey.shade100,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: Colors.grey.shade100,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ),
    elevation: 0.0,
    titleTextStyle: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: font!),
    iconTheme: const IconThemeData(color: Colors.black),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey.shade100,
    selectedIconTheme: const IconThemeData(size: 28.0, color: defaultColor),
    unselectedIconTheme: const IconThemeData(size: 24.0),
    selectedLabelStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: defaultColor),
    unselectedLabelStyle: const TextStyle(fontSize: 12.0),
    unselectedItemColor: Colors.black,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    elevation: 20.0,
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  textTheme: TextTheme(
    headline1: lightHeadline1,
    headline2: lightHeadline2,
    headline3: lightHeadline3,
    headline4: lightHeadline4,
    headline5: lightHeadline5,
    headline6: lightHeadline6,
    bodyText1: lightBodyText1,
    bodyText2: lightBodyText2,
    subtitle1: lightSubtitle1,
    subtitle2: lightSubtitle2,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.black),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.black),
    ),
    labelStyle: TextStyle(color: Colors.black),
    iconColor: Colors.black,
  ),
);

ThemeData darkTheme = ThemeData(
  fontFamily: font!,
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: HexColor('333739'),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
    elevation: 0.0,
    titleTextStyle: TextStyle(fontSize: 24.0, color: Colors.grey.shade300, fontWeight: FontWeight.bold, fontFamily: font!),
    iconTheme: IconThemeData(color: Colors.grey.shade300),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('333739'),
    selectedIconTheme: const IconThemeData(size: 28.0, color: defaultColor),
    unselectedIconTheme: const IconThemeData(size: 24.0),
    selectedLabelStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: defaultColor),
    unselectedLabelStyle: const TextStyle(fontSize: 12.0),
    unselectedItemColor: Colors.grey.shade300,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    elevation: 20.0,
  ),
  iconTheme: IconThemeData(color: Colors.grey.shade300),
  textTheme: TextTheme(
    headline1: darkHeadline1,
    headline2: darkHeadline2,
    headline3: darkHeadline3,
    headline4: darkHeadline4,
    headline5: darkHeadline5,
    headline6: darkHeadline6,
    bodyText1: darkBodyText1,
    bodyText2: darkBodyText2,
    subtitle1: darkSubtitle1,
    subtitle2: darkSubtitle2,
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    labelStyle: TextStyle(color: Colors.grey.shade300),
    iconColor: Colors.grey.shade300,
  ),
);
