import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateFormatted on DateTime {
  String get militaryTime => this.toUtc().toString().substring(10, 16);
  //returns String with date formatted e.g. Monday, January 1, 2020
  String formattedDate() {
    String dayOfWeek = new DateFormat('EEEE').format(this);
    String monthDayYear = new DateFormat.yMMMMd('en_US').format(this);
    String fullDate = dayOfWeek + ", " + monthDayYear;
    return fullDate;
  }

  //returns String with date formatted e.g. Mon January 1, 2020
  String abbreviatedDate() {
    String dayOfWeek = new DateFormat('EEEE').format(this);
    switch (dayOfWeek) {
      case "Tuesday":
        dayOfWeek = dayOfWeek.substring(0, 4); //first 4 letters i.e Tues
        break;
      case "Thursday":
        dayOfWeek = dayOfWeek.substring(0, 5); //first 5 letters i.e Thurs
        break;
      default:
        dayOfWeek = dayOfWeek.substring(0, 3); //first 3
    }
    String monthDayYear = new DateFormat.yMMMMd('en_US').format(this);
    String fullDate = dayOfWeek + ", " + monthDayYear;
    return fullDate;
  }
// ···
}

//generates custom colors
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
final Color colorSoftMelon = CustomColor('#FDC2BE');
final Color colorPale = CustomColor('#FAF3DD');
