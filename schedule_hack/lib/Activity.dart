import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

//primitive equivalent of Activity
class Activity extends Appointment {
  String start;
  String end;
  Image image;

  Activity(String start, String end, String subject, String notes)
      : super(
            startTime: DateTime.parse(start),
            endTime: DateTime.parse(end),
            subject: subject,
            notes: notes) {
    this.start = start;
    this.end = end;
    this.subject = subject;
    this.image = AppImage.getImageFromSubject(subject);
  }

  Activity.fromDateTime(
      DateTime startTime, DateTime endTime, String subject, String notes)
      : super(
            startTime: startTime,
            endTime: endTime,
            subject: subject,
            notes: notes) {
    this.start = startTime.toIso8601String();
    this.end = endTime.toIso8601String();
    this.subject = subject;
    this.image = AppImage.getImageFromSubject(subject);
  }

  //initializes assignment with subject == notes and start date 5 days before it's due
  Activity.assignment(DateTime dueDate, String subject)
      : this.fromDateTime(
            dueDate.subtract(Duration(days: 5)), dueDate, subject, subject);

  //test schedule event
  Activity.test(String subject, int day)
      : this.fromDateTime(
            DateTime.now().add(Duration(days: day)),
            DateTime.now().add(Duration(days: day, hours: 2)),
            subject,
            subject);

  //convert from json encodable
  toJSONEncodable() {
    Map<String, dynamic> m = new Map();
    m['start'] = start;
    m['end'] = end;
    m['subject'] = subject;
    m['notes'] = notes;
    return m;
  }
}
