import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: const Color(0XFF004E98),
      primaryColorDark: const Color(0XFFACACAC),
      cardColor: Colors.white,
      primaryColorLight: const Color.fromRGBO(252, 103, 82, 1),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Cairo",
      dividerTheme: const DividerThemeData(thickness: 0.5, color: Colors.grey),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
        iconSize: 40,
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.teal)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.tealAccent)),
        floatingLabelStyle: TextStyle(
            fontSize: 30.sp, fontWeight: FontWeight.bold, color: Colors.teal),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      appBarTheme: AppBarTheme(
          elevation: 0,
          titleTextStyle: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF000000)),
          color: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black, size: 24)),
      primarySwatch: Colors.blue,
      canvasColor: const Color(0XFF877EF2),
      primaryTextTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 40.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF000000)),
        headline2: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFC4C4C4)),
        headline3: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF000000)),
        headline4: TextStyle(
            color: Colors.black45,
            fontWeight: FontWeight.w900,
            fontSize: 30.0.sp),
        headline5: TextStyle(
            fontSize: 35.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFFFFFF)),
        headline6: TextStyle(
            color: Colors.black, fontSize: 32.sp, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFC4C4C4)),
        bodyText2: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF423E46)),
        subtitle1: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black54),
        subtitle2: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 59, 98, 238)),
        overline: TextStyle(
            fontSize: 15.sp,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w600,
            color: Colors.black),
        caption: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF5E5E5E)),
      ));

  static ThemeData darkTheme = ThemeData(
      primaryColor: const Color(0XFF004E98),
      primaryColorLight: Colors.amber,
      primaryColorDark: Colors.white70,
      primarySwatch: Colors.blue,
      cardColor: Colors.grey,
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.black,
      ),
      appBarTheme: AppBarTheme(
          elevation: 0,
          titleTextStyle: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFFFFFFF)),
          color: const Color.fromARGB(209, 17, 9, 35),
          iconTheme: const IconThemeData(color: Colors.white, size: 24)),
      primaryTextTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 40.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white), //heading screens text
        headline2: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white), // User Name text
        headline3: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.w400), // Gifts text
        headline4: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 30.0.sp),
        headline5: TextStyle(
            fontSize: 35.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFFFFFF)), // Button text
        headline6: TextStyle(
            color: Colors.white,
            fontSize: 32.sp,
            fontWeight: FontWeight.bold), //play video & skip Text
        subtitle1: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white), //screens Details terms text
        subtitle2: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 59, 98, 238)),
        bodyText1: TextStyle(
            fontSize: 18.sp,
            color: const Color.fromARGB(255, 206, 211, 213),
            fontWeight: FontWeight.w600), //wanna know Text
        bodyText2: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white), // play video subtitle
        caption: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: const Color.fromARGB(255, 244, 241, 241)),
        overline: TextStyle(
            fontSize: 15.sp,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w600,
            color: Colors.amber), //like intrests text
      ),
      scaffoldBackgroundColor: const Color.fromARGB(209, 17, 9, 35),
      fontFamily: "Cairo",
      dividerTheme: const DividerThemeData(thickness: 0.5, color: Colors.amber),
      iconTheme: const IconThemeData(color: Colors.white),
      inputDecorationTheme:
          const InputDecorationTheme(border: InputBorder.none));
}
