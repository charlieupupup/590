import 'package:flutter/cupertino.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

//primitive equivalent of Activity
class ScheduleEvent extends Appointment {
  String start;
  String end;
  Image image;

  // ScheduleEvent(String start, String end, String subject, String notes)
  //     : this.fromString(start, end, subject, notes);

  ScheduleEvent(String start, String end, String subject, String notes)
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

  ScheduleEvent.fromDateTime(
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

  ScheduleEvent.assignment(DateTime dueDate, String subject)
      : this.fromDateTime(
            DateTime.now(),
            DateTime.now().add(Duration(hours: 2)),
            "sleep",
            "8 hours of sleep");

  //test schedule event
  ScheduleEvent.test()
      : this.fromDateTime(
            DateTime.now(),
            DateTime.now().add(Duration(hours: 2)),
            "sleep",
            "8 hours of sleep");

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
