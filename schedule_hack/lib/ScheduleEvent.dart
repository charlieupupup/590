import 'package:schedule_hack/Activity.dart';

class ScheduleEvent {
  String title;
  String description;
  int duration;
  String date;

  ScheduleEvent({this.title, this.description, this.duration, this.date});

  ScheduleEvent.fromActivity(Activity activity) {
    this.title = activity.title;
    this.description = activity.description;
    this.duration = activity.duration.inHours;
    this.date = activity.date.toIso8601String();
  }

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();
    m['title'] = title;
    m['description'] = description;
    m['duration'] = duration;
    m['date'] = date;
    return m;
  }
}
