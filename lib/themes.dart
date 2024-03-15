import 'package:flutter/material.dart';

class MyTheme {
  static Color greenColor = const Color(0xff39A552);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color blackColor = const Color(0xff4F5A69);
  static Color redColor = const Color(0xffC91C22);
  static Color blueColor = const Color(0xff003E90);
  static Color pinkColor = const Color(0xffED1E79);
  static Color brownColor = const Color(0xffCF7E48);
  static Color blueOpenCFColor = const Color(0xff4882CF);
  static Color yellowColor = const Color(0xffF2D352);

  // light mode
  static ThemeData lightMode = ThemeData(
    drawerTheme: DrawerThemeData(backgroundColor: whiteColor),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: greenColor,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)))),
    textTheme: TextTheme(
      titleMedium: TextStyle(
          color: blackColor, fontSize: 15, fontWeight: FontWeight.normal),
      titleLarge: TextStyle(
          color: blackColor, fontSize: 22, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(
          color: whiteColor, fontSize: 22, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(
          color: whiteColor, fontSize: 22, fontWeight: FontWeight.bold),
    ),
  );
  static ThemeData darkMode = ThemeData(
    drawerTheme: DrawerThemeData(backgroundColor: blackColor),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: blackColor,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)))),
    textTheme: TextTheme(
      titleMedium: TextStyle(
          color: whiteColor, fontSize: 15, fontWeight: FontWeight.normal),
      titleLarge: TextStyle(
          color: whiteColor, fontSize: 22, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(
          color: blackColor, fontSize: 22, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(
          color: blackColor, fontSize: 22, fontWeight: FontWeight.bold),
    ),
  );
}
