import 'package:schedule_hack/Activity.dart';

class ScheduleEvent {
  String title;
  String description;
  String date;
  String endDate;

  ScheduleEvent({this.title, this.description, this.endDate, this.date});

  ScheduleEvent.fromActivity(Activity activity) {
    this.title = activity.title;
    this.description = activity.description;
    this.date = activity.date.toIso8601String();
    this.endDate = activity.endDate.toIso8601String();
  }

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();
    m['title'] = title;
    m['description'] = description;
    m['startDate'] = date;
    m['endDate'] = endDate;
    return m;
  }
}
