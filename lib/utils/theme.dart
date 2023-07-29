import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darHeaderClr = Color(0xFF424242);

class Themes {
  // static final Color textColor1 = Color(0xFF989acd);
   final Color textColor2 =  const Color(0xFF878593);
  // static final Color bigTextColor = Color(0xFF2e2e31);

  //blue color
  static final Color blueColor100 = HexColor('#363B8D');
  static final Color blueColor200 = HexColor('#061E88');
  static final Color blueColor300 = HexColor('#071133');
  static final Color blueColor400 = HexColor('#010082');
  static final Color blueColor500 = HexColor('#010020');

  static final Color orangeColor = HexColor('#d55d02');
  static final Color redColor = HexColor('#b50000');


  //green color
  static final Color greenColor100 = HexColor('#00FB9E');
  static final Color greenColor200 = HexColor('#1FCE5D');
  static final Color greenColor300 = HexColor('#038936');
  static final Color greenColor400 = HexColor('#014100');


  

  static const Color errorColor100 = Colors.redAccent;

  // static final Color starColor = Color(0xFFe7bb4e);
  // static final Color mainTextColor = Color(0xFFababad);
  // static final Color buttonBackground = Color(0xFFf1f1f9);

  static final light = ThemeData(
    backgroundColor: Colors.white,
    fontFamily: "Be Vietnam Pro",
    scaffoldBackgroundColor: Colors.white,
    shadowColor: Colors.grey.withOpacity(0.2),
    primaryColorLight: greenColor100,
    primaryColor: greenColor200,
    primaryColorDark: greenColor200,
    splashColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor("#F8F8F8"), 
      unselectedItemColor: Themes.greenColor300,
      selectedItemColor: Themes.greenColor400
      ),
    textTheme: const TextTheme(headline1: TextStyle(color: Colors.black)),
    // shadowColor: Colors.white,
    // cardColor: Colors.white,
    // primaryColor: primaryClr,
    brightness: Brightness.light,
    // // colorSchemeSeed: primaryClr,
    // appBarTheme: const AppBarTheme(
    //   color: primaryClr,
    // ),
  );

  static final dark = ThemeData(
    backgroundColor: HexColor("#080808"),
    fontFamily: "Be Vietnam Pro",
    scaffoldBackgroundColor: HexColor("#080808"),
    shadowColor: Colors.grey.withOpacity(0.1),
    primaryColorLight: greenColor100,
    primaryColor: greenColor200,
    primaryColorDark: greenColor200,
    splashColor: Colors.black.withOpacity(0.5),
    textTheme: TextTheme(headline1: TextStyle(color: Colors.white.withOpacity(0.7))),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor("#101010"),
      unselectedItemColor: Themes.greenColor100.withOpacity(0.7),
      selectedItemColor: Themes.greenColor100
    ),
    // appBarTheme: const AppBarTheme(
    //   color: primaryClr,
    // ),
    // colorSchemeSeed: darkGreyClr,
    // primaryColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}
