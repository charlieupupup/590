import 'dart:core';

import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:schedule_hack/Activity.dart';

class Day extends DateTime {
  List<Activity> activities =
      List(24); //list of activities, index representing hour
  Map<int, Activity> get timeActivityMap =>
      activities.asMap(); // map of hour to activity

  Day.year(int year)
      : super(year); //original default constructor from parent class
  Day.day(DateTime dateTime)
      : super(
            dateTime.year,
            dateTime.month,
            dateTime.day,
            dateTime.hour,
            dateTime
                .minute); //constructor that initializes new Day object @ dateTime
  factory Day.planned(DateTime dateTime, List<Activity> activities) {
    Day date = Day.day(dateTime);
    date.activities = activities;
    return date;
  } //constructor that initializes new Day with 'activities' planned

  bool isAvailable(hour) {
    assert(activities.length == 24);
    if (this.activities[hour] == null) {
      return true;
    } else {
      return false;
    }
  }

  void addActivity(Activity activity) {}
}
