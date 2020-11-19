import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Assignment.dart';
import 'package:schedule_hack/ScheduleEvent.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Activity extends Appointment {
  Activity.fromScheduleEvent(ScheduleEvent scheduleEvent)
      : super(
            startTime: DateTime.parse(scheduleEvent.date),
            endTime: DateTime.parse(scheduleEvent.endDate),
            isAllDay: false,
            subject: scheduleEvent.title);

  // this.description = scheduleEvent.description;
  Activity.fromActivityOld(ActivityOld old)
      : this.fromScheduleEvent(new ScheduleEvent.fromActivityOld(old));
}

class ActivityOld extends Event {
  DateTime endDate;
  String description;

  ActivityOld.fromScheduleEvent(ScheduleEvent scheduleEvent)
      : super(
            date: DateTime.parse(scheduleEvent.date),
            title: scheduleEvent.title,
            icon: Icon(
              Icons.access_time,
              color: colorBlackCoral,
              size: 30.0,
            ),
            dot: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              color: colorMelon,
              height: 5.0,
              width: 5.0,
            )) {
    this.endDate = DateTime.parse(scheduleEvent.endDate);
  }

  //default constructor string must be in iso
  ActivityOld.fromIso8601(
      String startDate, String endDate, String title, String description)
      : super(
            date: DateTime.parse(startDate),
            title: title,
            icon: Icon(
              Icons.access_time,
              color: colorBlackCoral,
              size: 30.0,
            ),
            dot: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              color: colorMelon,
              height: 5.0,
              width: 5.0,
            )) {
    this.endDate = DateTime.parse(endDate);
  }

  ActivityOld.fromAssigment(DateTime dueDate, Assignment assignment)
      : super(
            date: (dueDate).subtract(Duration(
                days: 5)), //TODO maybe change this from 5 day but whatever
            title: assignment.description,
            icon: Icon(
              Icons.access_time,
              color: colorBlackCoral,
              size: 30.0,
            ),
            dot: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              color: colorMelon,
              height: 5.0,
              width: 5.0,
            )) {
    this.endDate = dueDate;
  }
}
