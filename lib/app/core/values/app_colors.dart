import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color kPrimaryColor = Color(0xFFAFCE1D);
  static const Color parsley = Color(0xFF155231);
  static const Color valhalla = Color(0xFF301A4B);
  static const Color goblin = Color(0xFF3D764B);
  static const Color seashell = Color(0xFFF1F1F1);
  static const Color periwinkle = Color(0xFFC6D4FF);
  static const Color sunshade = Color(0xFFFFA630);

  static const MaterialColor kprimarycolor =
      MaterialColor(_kprimarycolorPrimaryValue, <int, Color>{
    50: Color(0xFFF5F9E4),
    100: Color(0xFFE7F0BB),
    200: Color(0xFFD7E78E),
    300: Color(0xFFC7DD61),
    400: Color(0xFFBBD53F),
    500: Color(_kprimarycolorPrimaryValue),
    600: Color(0xFFA8C91A),
    700: Color(0xFF9FC215),
    800: Color(0xFF96BC11),
    900: Color(0xFF86B00A),
  });
  static const int _kprimarycolorPrimaryValue = 0xFFAFCE1D;

  static const MaterialColor kprimarycolorAccent =
      MaterialColor(_kprimarycolorAccentValue, <int, Color>{
    100: Color(0xFFF5FFDC),
    200: Color(_kprimarycolorAccentValue),
    400: Color(0xFFD8FF76),
    700: Color(0xFFD1FF5D),
  });
  static const int _kprimarycolorAccentValue = 0xFFE7FFA9;
}
