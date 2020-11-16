import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension CalendarDateTime on DateTime {
  static firstDayOfWeek(DateTime date) {
    return date.subtract(new Duration(days: date.weekday % 7));
  }
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

/*
These are impossible to remember so I'm leaving them here in utilities as an easy resource
date is a DateTime

DateFormat.yMMMMEEEEd('en_US').format(date) //Sunday, November 15, 2020
DateFormat.yMMMMd('en_US').format(date) //November 15, 2020
DateFormat.yMMMM('en_US').format(date) //November 2020
DateFormat.yMMMEd('en_US').format(date) //Sun, Nov 15, 2020
DateFormat.yMMMd('en_US').format(date) //Nov 15, 2020
DateFormat.yMMMM('en_US').format(date) // November 2020
DateFormat.yMEd('en_US').format(date) // Sun, 11/15/2020
DateFormat.yMd('en_US').format(date) // 11/15/2020
DateFormat.jm().format(date) // 12:48 PM
 */
//global variable for whether or not survey has been completed by the user
bool surveyDone = false;

//set global user preferences
