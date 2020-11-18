import 'package:flutter_calendar_carousel/classes/event.dart';

class ScheduleEvent extends Event {
  String img;
  String title;
  String interval;

  ScheduleEvent(String img, String title, String interval) {
    this.img = img;
    this.title = title;
    this.interval = interval;
  }
}
