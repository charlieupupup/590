import 'package:flutter/material.dart';
import 'package:schedule_hack/DateBanner.dart';
import 'package:schedule_hack/utilities.dart';

import 'SettingsButton.dart';

class Schedule extends StatelessWidget {
  Schedule({Key key, this.title, this.date}) : super(key: key);
  final String title;
  DateTime date;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios,
          color: colorBlackCoral,
        ),
        actions: [
          Row(
            children: [
              //Icon(Icons.settings, color: colorBlackCoral),
              SettingsButton()
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
          children: [DateBanner(date: date)],
        ),
      ),
    );
  }
}
