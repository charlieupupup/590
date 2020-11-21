import 'package:flutter/material.dart';
import 'package:schedule_hack/Activities.dart';
import 'package:schedule_hack/ActivityDataSource.dart';
import 'package:schedule_hack/CalendarButton.dart';
import 'package:schedule_hack/DateBanner.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/ScheduleView.dart';
import 'package:schedule_hack/utilities.dart';

import 'Home.dart';

import 'SettingsButton.dart';

class Schedule extends StatelessWidget {
  Activities _scheduleToday;
  // List<Activity> _scheduleToday;
  final String title;
  DateTime date;
  ActivityDataSource get activityDataSource {
    return new ActivityDataSource(_scheduleToday);
  }

  Activity a0 = new Activity.test("Study", 0);
  Activity a1 = new Activity.test("Attend Class", 2);
  Activity a2 = new Activity.test("Sleep", 4);

  Schedule({Key key, this.title, this.date}) : super(key: key) {
    List<Activity> activities = [a0, a1, a2];
    _scheduleToday = new Activities.fromActivities(DateTime.now(), activities);
  }
  @override
  Widget build(BuildContext context) {
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
          children: [DateBanner(date: date), ScheduleView(activityDataSource)],
        ),
      ),
    );
  }
}
