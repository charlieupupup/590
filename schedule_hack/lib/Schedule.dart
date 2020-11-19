import 'package:flutter/material.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/CalendarButton.dart';
import 'package:schedule_hack/DateBanner.dart';
import 'package:schedule_hack/ScheduleView.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

import 'Home.dart';

import 'SettingsButton.dart';

class Schedule extends StatelessWidget {
  //EventList<Event> _scheduleToday;
  List<Activity> _scheduleToday;
  final String title;
  DateTime date;

  Activity a0 = new Activity.fromIso8601(
      DateTime(2020, 11, 4, 1).toIso8601String(),
      DateTime(2020, 11, 4, 3).toIso8601String(),
      "ECE564",
      "Attend ECE564");
  Activity a1 = new Activity.fromIso8601(
      DateTime(2020, 11, 7, 2).toIso8601String(),
      DateTime.now().toIso8601String(),
      "ECE564",
      "Final Presentation");
  Activity a2 = new Activity.fromIso8601(
      DateTime(2020, 11, 12, 2).toIso8601String(),
      DateTime.now().toIso8601String(),
      "ECE564",
      "Final Presentation");

  Schedule({Key key, this.title, this.date}) : super(key: key) {
    _scheduleToday = [a0, a1, a2];
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: colorBlackCoral,
            ),
            onPressed: () {
              // Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(0),
                ),
              );
            }),
        actions: [
          Row(
            children: [
              CalendarButton(),
              SettingsButton(),
            ],
          ),
        ],
        title: Text('ScheduleHack',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: colorBlackCoral)),
        backgroundColor: colorHoneydew,
      ),
      body: Container(
        child: ListView(
          //children: [DateBanner(date: date), ScheduleView(_list)],
          children: [DateBanner(date: date), ScheduleView(_scheduleToday)],
        ),
      ),
    );
  }
}
