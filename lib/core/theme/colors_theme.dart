import 'package:flutter/material.dart';

class ColorsAppTheme {
  static const int _valuePrimaryColor = 0xFF01E5DC,
      _valueAccentColor = 0xFFDFFFFE,
      _favoriteColor = 0xFFFD4D74,
      _starColor = 0xFFFFC000,
      _darkBlue = 0xFF0f2e3a,
      _blue = 0xFF1B62F8,
      _hightDemandBackgroundColor = 0xFFFFE2E9,
      _yellowLight = 0xFFFFF7DF,
      _redLight = 0xFFFFECF0,
      _aliceblue = 0xFFE9F0FF,
      _green = 0xFF25D366;

  static const Color primaryColor = Color(_valuePrimaryColor),
      acentColor = Color(_valueAccentColor),
      favoriteColor = Color(_favoriteColor),
      starColor = Color(_starColor),
      hightDemandBackgroundColor = Color(_hightDemandBackgroundColor),
      darkBlue = Color(_darkBlue),
      blue = Color(_blue),
      white = Colors.white,
      yellowLight = Color(_yellowLight),
      redLight = Color(_redLight),
      aliceblue = Color(_aliceblue),
      green = Color(_green);

  static MaterialColor primarySwatch = const MaterialColor(_valuePrimaryColor, {
    50: acentColor,
    100: Color(0xFF19FFF7),
    200: Color(0xFF1AFFF7),
    300: primaryColor,
    400: Color(0xFF00CCC5),
    500: Color(0xFF00B3AD),
    600: Color(0xFF009994),
    700: Color(0xFF00807B),
    800: Color(0xFF006663),
    900: Color(0xFF004D4A),
  });

  static MaterialColor greyAppPalette = const MaterialColor(0xFFACBFDC, {
    50: Color(0xFFF7F9FC),
    100: Color(0xFFE4E9F2),
    200: Color(0xFFACBFDC),
    300: Color(0xFF7D8D94),
    400: Color(0xFF012430),
    500: Color(0xFF22354C),
  });
}
