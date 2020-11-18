import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:schedule_hack/Assignment.dart';
import 'package:schedule_hack/ScheduleList.dart';
import 'package:schedule_hack/utilities.dart';

class Activity extends Event {
  Duration duration;
  String description;

  Activity.fromScheduleItem(ScheduleItem scheduleItem)
      : super(
            date: DateTime.parse(scheduleItem.date),
            title: scheduleItem.title,
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
    this.duration = Duration(hours: scheduleItem.duration);
    this.description = scheduleItem.description;
  }

  //default constructor string must be in iso
  Activity(String start, int duration, String title, String description)
      : super(
            date: DateTime.parse(start),
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
    this.duration = Duration(hours: duration);
    this.description = description;
  }

  Assignment getAssignment() {
    return new Assignment.long(description, date.toIso8601String(),
        date.subtract(duration).toIso8601String());
  }

  Activity.standard(
      DateTime start, Duration duration, String title, String description)
      : super(
            date: start,
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
    this.duration = duration;
    this.description = description;
  }

  //constructor for an assignment
  Activity.assignment(DateTime dueDate, Duration timeToComplete, String title,
      String description)
      : super(
            date: dueDate.subtract(
                timeToComplete), //start time = dueDate - time to completeAssignment
            title: title,
            icon: Icon(
              Icons.assignment,
              color: colorBlackCoral,
              size: 30.0,
            ),
            dot: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              color: colorSoftMelon,
              height: 5.0,
              width: 5.0,
            )) {
    this.duration = timeToComplete;
    this.description = description;
  }

  //TODO: course constructor that will add in repeat? or maybe ClassAttendance subclass of Activity with some kind of list of DaysOfWeek

}
