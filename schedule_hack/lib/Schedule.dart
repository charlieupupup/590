import 'package:flutter/material.dart';
import 'package:schedule_hack/DateBanner.dart';

import 'package:schedule_hack/TabBar.dart' as T;

class Schedule extends StatelessWidget {
  Schedule({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.settings),
            ],
          ),
        ],
        title: Text('ScheduleHack'),
        backgroundColor: Colors.green[100],
      ),
      bottomNavigationBar: SizedBox(
        height: 58,
        child: T.TabBar().build(context),
      ),
      body: Container(
        child: ListView(
          children: [DateBanner(date: 'hi drew')],
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
