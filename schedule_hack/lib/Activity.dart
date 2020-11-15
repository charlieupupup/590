import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart';
import 'package:schedule_hack/utilities.dart';

enum Task { attendClass, doAssignment, sleep, takeBreak, workout }

class Activity extends Event {
  Task task;
  Duration duration;
  String description;

  //default constructor
  Activity(Task task, DateTime start, Duration duration, String title,
      String description)
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
    this.task = task;
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
    this.task = Task.doAssignment;
    this.duration = timeToComplete;
    this.description = description;
  }

  //TODO: course constructor that will add in repeat? or maybe ClassAttendance subclass of Activity with some kind of list of DaysOfWeek

//string to return currently just for testing
  String getInfo() {
    return description +
        "(" +
        task.toString() +
        ") on " +
        DateFormat.yMMMMEEEEd('en_US').format(date) +
        "for " +
        duration.inHours.toString() +
        " hours starting " +
        DateFormat.jm().format(date);
  }
}
