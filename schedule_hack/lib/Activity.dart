import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:schedule_hack/Assignment.dart';
import 'package:schedule_hack/ScheduleEvent.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

//class that will replace Activity. Equivalent to a ScheduleEvent
class ActivityNew extends Appointment {
//default
  ActivityNew(DateTime startDate, DateTime endDate, String subject)
      : super(
            startTime: startDate,
            endTime: endDate,
            isAllDay: false,
            subject: subject);

  //convert from Schedule Event
  ActivityNew.fromScheduleEvent(ScheduleEvent scheduleEvent)
      : super(
            startTime: DateTime.parse(scheduleEvent.startTime),
            endTime: DateTime.parse(scheduleEvent.endTime),
            isAllDay: false,
            subject: scheduleEvent.subject);
  //convert from soon to be depreciated Activity class
  ActivityNew.fromActivityOld(Activity old)
      : this.fromScheduleEvent(new ScheduleEvent.fromActivityOld(old));
}

//old class from old calendar
class Activity extends Event {
  DateTime endDate;
  String description;

  Activity.fromScheduleEvent(ScheduleEvent scheduleEvent)
      : super(
            date: DateTime.parse(scheduleEvent.startTime),
            title: scheduleEvent.subject,
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
    this.endDate = DateTime.parse(scheduleEvent.endTime);
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
  }
}
