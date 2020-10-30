import 'package:flutter/material.dart';
import 'package:schedule_hack/DateBanner.dart';
import 'package:intl/intl.dart';
import 'package:schedule_hack/utilities.dart';

class Schedule extends StatelessWidget {
  Schedule({Key key, this.title, this.date}) : super(key: key);
  final String title;
  DateTime date;

  //returns String with date formatted e.g. Monday, January 1, 2020
  String getFormattedDate() {
    String dayOfWeek = new DateFormat('EEEE').format(this.date);
    String monthDayYear = new DateFormat.yMMMMd('en_US').format(this.date);
    String fullDate = dayOfWeek + ", " + monthDayYear;
    return fullDate;
  }

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
              Icon(Icons.settings, color: colorBlackCoral),
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
      bottomNavigationBar: SizedBox(
        height: 58,
        // child: T.TabBar().build(context),
      ),
      body: Container(
        child: ListView(
          children: [DateBanner(date: this.getFormattedDate())],
        ),
      ),
    );
  }
}
