import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activity.dart';

class ScheduleItem {
  String title;
  String description;
  int duration;
  String date;
  int type;

  ScheduleItem(
      {this.title, this.description, this.duration, this.date, this.type});

  ScheduleItem.fromActivity(Activity activity) {
    this.title = activity.title;
    this.description = activity.description;
    this.duration = activity.duration.inHours;
    this.date = activity.date.toIso8601String();
    this.type = 0;
  }

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();
    m['title'] = title;
    m['description'] = description;
    m['duration'] = duration;
    m['date'] = date;
    m['type'] = type;
    return m;
  }
}

class ScheduleList {
  List<ScheduleItem> items;
  List<Activity> get activityList {
    List<Activity> list = new List<Activity>();
    for (int i = 0; i < this.items.length; i++) {
      list.add(Activity.fromScheduleItem(this.items[i]));
    }
    return list;
  }

  ScheduleList() {
    items = new List();
  }

  ScheduleList.fromActivityList(List<Activity> events) {
    items = getScheduleItems(events);
  }

  toJSONEncodable() {
    return items.map((item) {
      return item.toJSONEncodable();
    }).toList();
  }

  List<ScheduleItem> getScheduleItems(List<Activity> events) {
    List<ScheduleItem> list = new List<ScheduleItem>();
    for (int i = 0; i < events.length; i++) {
      list.add(ScheduleItem.fromActivity(events[i]));
    }
    print("list $list");
    return list;
  }

  List<Activity> getActivityList(List<ScheduleItem> itemList) {
    List<Activity> list = new List<Activity>();
    for (int i = 0; i < itemList.length; i++) {
      list.add(Activity.fromScheduleItem(itemList[i]));
    }
    return list;
  }


}
