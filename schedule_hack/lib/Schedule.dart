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
  List<Activity> _scheduleToday;
  ActivityDataSource get activityDataSource {
    return new ActivityDataSource(_scheduleToday);
  }

  //returns list of appointmnets from activity datasource
  List<Activity> get _appointments {
    return activityDataSource.appointments as List<Activity>;
  }

  Schedule(List<Activity> activities) {
    this._scheduleToday = activities;
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
          // children: [DateBanner(date: date), ScheduleView(activityDataSource)],
          children: [
            DateBanner(date: DateTime.now()),
            ScheduleView(_appointments)
          ],
        ),
      ),
    );
  }
}
