import 'dart:ui';
import 'package:flutter/material.dart';

class HexToColor extends Color {
  static _hexToColor(String code) {
    return int.parse(code.substring(1, 7), radix: 16) + 0xFF000000;
  }

  HexToColor(final String code) : super(_hexToColor(code));
}

final Color colorMelon = HexToColor('#FFA69E');
final Color colorAlmond = HexToColor('#F0E0D0');
final Color colorBeige = HexToColor('#EAF3E0');
final Color colorHoneydew = HexToColor('#D9F3E2');
final Color colorAeroBlue = HexToColor('#B8F2E6');
final Color colorPowderBlue = HexToColor('#AED9E0');
final Color colorBlackCoral = HexToColor('#5E6472');
final Color colorIvory = HexToColor('#F5F9F0');
