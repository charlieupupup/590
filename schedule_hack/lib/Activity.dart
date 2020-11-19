import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:schedule_hack/Assignment.dart';
import 'package:schedule_hack/ScheduleEvent.dart';
import 'package:schedule_hack/utilities.dart';

class Activity extends Event {
  DateTime endDate;
  String description;

  Activity.fromScheduleEvent(ScheduleEvent scheduleEvent)
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
    this.description = scheduleEvent.description;
  }

  //default constructor string must be in iso
  Activity.fromIso8601(
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
    this.description = description;
  }

  Activity.fromAssigment(DateTime dueDate, Assignment assignment)
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
    this.description = "$title inputted from Syllabus";
  }

  Assignment getAssignment() {
    return new Assignment.long(
        description, date.toIso8601String(), endDate.toIso8601String());
  }

  //TODO: course constructor that will add in repeat? or maybe ClassAttendance subclass of Activity with some kind of list of DaysOfWeek

}
