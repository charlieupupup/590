import 'package:flutter/material.dart';
import 'package:schedule_hack/Activities.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class ActivityDataSource extends CalendarDataSource {
  /// Creates a Activities data source, which used to set the appointment
  /// collection to the calendar
  ActivityDataSource(List<Activity> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].endTime;
  }

  @override
  String getSubject(int index) {
    return appointments[index].subject;
  }

  @override
  Color getColor(int index) {
    return colorMelon;
  }

  @override
  bool isAllDay(int index) {
    return false;
  }
}
