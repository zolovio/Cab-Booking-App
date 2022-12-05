import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class AppColors {
  static final colorPrimary = HexColor('#EEAB47');
  static const black = Colors.black;
  static const white = Colors.white;
  static const colorAccent = Color.fromRGBO(255, 46, 0, 100);
  static const darkBackground = Color.fromRGBO(2, 15, 75, 100);
  static final lightBackground = HexColor('#F1F1F1');
  static const grey = Color.fromARGB(38, 0, 0, 0);
  static final gradientBlue = HexColor('#BBDEF2');
  static final deepOrange = HexColor('#DB5F2E');
  static final liteOrange = HexColor('#EEAB47');
  static final deepBlue = HexColor('#2D79FE');
  static final liteBlue = HexColor('#23D1FF');
  static final deepBlue2 = HexColor('#28A5FF');

  static final green = HexColor('#45A849');
}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: AppColors.lightBackground,
  primaryColor: AppColors.colorPrimary,
  primarySwatch: Colors.orange,
  iconTheme: IconThemeData(
    color: Colors.black.withOpacity(0.1),
  ),
);
