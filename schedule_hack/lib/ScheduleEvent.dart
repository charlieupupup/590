import 'package:syncfusion_flutter_calendar/calendar.dart';

//primitive equivalent of Activity
class ScheduleEvent extends Appointment {
  String start;
  String end;

  ScheduleEvent.fromDateTime(
      DateTime startTime, DateTime endTime, String subject)
      : super(startTime: startTime, endTime: endTime, subject: subject) {
    this.start = startTime.toIso8601String();
    this.end = endTime.toIso8601String();
  }

  ScheduleEvent.fromString(String start, String end, String subject)
      : super(
            startTime: DateTime.parse(start),
            endTime: DateTime.parse(end),
            subject: subject) {
    this.start = start;
    this.end = end;
  }

  //test schedule event
  ScheduleEvent.test()
      : this.fromDateTime(DateTime.now(),
            DateTime.now().add(Duration(hours: 2)), "8 hours of sleep");

  //convert from json encodable
  toJSONEncodable() {
    Map<String, dynamic> m = new Map();
    m['subject'] = subject;
    m['startTime'] = startTime;
    m['endTime'] = endTime;
    return m;
  }
}
