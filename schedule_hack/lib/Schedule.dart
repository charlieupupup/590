import 'package:flutter/material.dart';
import 'package:schedule_hack/DateBanner.dart';
import 'package:intl/intl.dart';
import 'package:schedule_hack/TabBar.dart' as T;
import 'package:schedule_hack/utilities.dart';

class Schedule extends StatelessWidget {
  Schedule({Key key, this.title}) : super(key: key);
  final String title;
  String today;

  String getToday() {
    String dayOfWeek = new DateFormat('EEEE').format(DateTime.now());
    String date = new DateFormat.yMMMMd('en_US').format(DateTime.now());
    String today = dayOfWeek + ", " + date;
    return today;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
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
        child: T.TabBar().build(context),
      ),
      body: Container(
        child: ListView(
          children: [DateBanner(date: this.getToday())],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
