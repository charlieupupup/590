import 'package:schedule_hack/Activity.dart';

class ScheduleEvent {
  String title;
  String date;
  String endDate;

  ScheduleEvent({this.title, this.endDate, this.date});

  ScheduleEvent.fromActivityOld(ActivityOld activity) {
    this.title = activity.title;
    this.date = activity.date.toIso8601String();
    this.endDate = activity.endDate.toIso8601String();
  }

  ScheduleEvent.fromActivity(Activity activity) {
    this.title = activity.subject;
    this.date = activity.startTime.toIso8601String();
    this.endDate = activity.endTime.toIso8601String();
  }

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();
    m['title'] = title;
    m['startDate'] = date;
    m['endDate'] = endDate;
    return m;
  }
}
