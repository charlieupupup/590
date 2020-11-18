import 'package:flutter_calendar_carousel/classes/event.dart';

class ScheduleEvent extends Event {
  String img;
  String title;
  String interval;

  ScheduleEvent(String img, String title, String interval, DateTime dateTime)
      : super(
          date: dateTime,
        ) {
    this.img = img;
    this.title = title;
    this.interval = interval;
  }
}
