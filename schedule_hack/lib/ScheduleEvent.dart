import 'package:schedule_hack/Activity.dart';

//primitive equivalent of Activity
class ScheduleEvent {
  String subject;
  String startTime;
  String endTime;

  ScheduleEvent({this.subject, this.startTime, this.endTime});

  //test schedule event
  ScheduleEvent.test() {
    subject = "8 hours of sleep";
    startTime =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .toIso8601String();
    endTime = DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day, 8)
        .toIso8601String();
  }

  //convert from ActivityOld
  ScheduleEvent.fromActivityOld(Activity activity) {
    this.subject = activity.title;
    this.startTime = activity.date.toIso8601String();
    this.endTime = activity.endDate.toIso8601String();
  }

  //convert from ActivityNew
  ScheduleEvent.fromActivityNew(ActivityNew activity) {
    this.subject = activity.subject;
    this.startTime = activity.startTime.toIso8601String();
    this.endTime = activity.endTime.toIso8601String();
  }

  //convert from json encodable
  toJSONEncodable() {
    Map<String, dynamic> m = new Map();
    m['subject'] = subject;
    m['startTime'] = startTime;
    m['endTime'] = endTime;
    return m;
  }
}
