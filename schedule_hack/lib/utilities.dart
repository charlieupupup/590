import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/AppStorage.dart';
import 'package:schedule_hack/Course.dart';
import 'package:schedule_hack/UserPreferences.dart';

extension CalendarDateTime on DateTime {
  static firstDayOfWeek(DateTime date) {
    return date.subtract(new Duration(days: date.weekday % 7));
  }
}

extension TimeOfDayConverter on TimeOfDay {
  //takes in string form '12:34PM' returns TimeOfDay
  static TimeOfDay fromString(String time) {
    int hourOffset = 0;
    if (time.endsWith('PM')) {
      hourOffset = 12;
    }
    int hour = int.parse(time.split(':')[0]) + hourOffset;
    int minute = int.parse(time.split(':')[1].substring(0, 2));
    return TimeOfDay(hour: hour, minute: minute);
  }

  //returns Duration from two TimeOfDay on same Day
  static Duration fromTimesOfDay(
      DateTime day, TimeOfDay startTime, TimeOfDay endTime) {
    //return 0 if start is after end
    if (startTime.hour >= endTime.hour) {
      if (startTime.hour > endTime.hour) {
        return Duration(days: 0);
      } else if ((startTime.hour == endTime.hour) &&
          (startTime.minute >= endTime.minute)) {
        return Duration(days: 0);
      }
    }
    DateTime start = DateTimeConverter.fromTimeOfDay(day, startTime);
    DateTime end = DateTimeConverter.fromTimeOfDay(day, endTime);
    int hours = end.hour - start.hour;
    int minutes = end.minute - start.minute;
    return Duration(days: 0, hours: hours, minutes: minutes);
  }
}

extension DateTimeConverter on DateTime {
  //takes a DateTime and a time of day and creates a DateTime on that day at that time
  static DateTime fromTimeOfDay(DateTime day, TimeOfDay time) {
    return DateTime(day.year, day.month, day.day, time.hour, time.minute);
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
final Color colorDarkSkyBlue = CustomColor('#9ABCC5');
final Color colorPewterBlue = CustomColor('#869FA9');
final Color colorBlackCoral = CustomColor('#5E6472');
final Color colorIvory = CustomColor('#F5F9F0');
final Color colorSoftMelon = CustomColor('#FDC2BE');
final Color colorPale = CustomColor('#FAF3DD');

enum Tab { schedule, selfCare, courses }

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
UserPreferences userSettings;

// global variable for course currently being edited
Course globalCourse;

//global variable for referencing calendar json
final LocalStorage calendarStorage = new LocalStorage('calendar.json');
