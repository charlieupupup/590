import 'dart:ui';
import 'package:flutter/material.dart';

class CustomColor extends Color {
  static hexToColor(String code) {
    return int.parse(code.substring(1, 7), radix: 16) + 0xFF000000;
  }

  CustomColor(final String code) : super(hexToColor(code));
}

final Color colorMelon = CustomColor('#FFA69E');
final Color colorAlmond = CustomColor('#F0E0D0');
final Color colorBeige = CustomColor('#EAF3E0');
final Color colorHoneydew = CustomColor('#D9F3E2');
final Color colorAeroBlue = CustomColor('#B8F2E6');
final Color colorPowderBlue = CustomColor('#AED9E0');
final Color colorBlackCoral = CustomColor('#5E6472');
final Color colorIvory = CustomColor('#F5F9F0');
