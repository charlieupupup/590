
import 'dart:ui';
import 'package:flutter/material.dart';

class HexToColor extends Color{
  static _hexToColor(String code) {
    return int.parse(code.substring(1, 7), radix: 16) + 0xFF000000;
  }
  HexToColor(final String code) : super(_hexToColor(code));
}

final Color MELON = HexToColor('#FFA69E');
final Color ALMOND = HexToColor('#F0E0D0');
final Color BEIGE = HexToColor('#EAF3E0');
final Color HONEYDEW = HexToColor('#D9F3E2');
final Color AEROBLUE = HexToColor('#B8F2E6');
final Color POWDERBLUE = HexToColor('#AED9E0');
final Color BLACKCORAL = HexToColor('#5E6472');






