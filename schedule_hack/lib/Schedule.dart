import 'package:flutter/material.dart';
import 'package:schedule_hack/CalendarButton.dart';
import 'package:schedule_hack/DateBanner.dart';
import 'package:schedule_hack/Day.dart';
import 'package:schedule_hack/ScheduleView.dart';
import 'package:schedule_hack/utilities.dart';

import 'Home.dart';
import 'ScheduleEvent.dart';
import 'SettingsButton.dart';

class Schedule extends StatelessWidget {
  List<ScheduleEvent> _list;
  final String title;
  DateTime date;

  ScheduleEvent s0 = ScheduleEvent(
      'images/running.png', 'soccer', '3 - 5 pm', DateTime(2020, 11, 1));
  ScheduleEvent s1 = ScheduleEvent(
      'images/running.png', 'soccer', '3 - 5 pm', DateTime(2020, 11, 1));
  ScheduleEvent s2 = ScheduleEvent(
      'images/running.png', 'soccer', '3 - 5 pm', DateTime(2020, 11, 1));

  Schedule({Key key, this.title, this.date}) : super(key: key) {
    _list = [s0, s1, s2];
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
        // Icon(
        //   Icons.arrow_back_ios,
        //   color: colorBlackCoral,
        // ),
        actions: [
          Row(
            children: [
              //Icon(Icons.settings, color: colorBlackCoral),
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
          children: [DateBanner(date: date), ScheduleView(_list)],
        ),
      ),
    );
  }
}
