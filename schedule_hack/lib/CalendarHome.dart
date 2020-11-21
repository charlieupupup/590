import 'package:flutter/material.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/CourseList.dart';
import 'package:schedule_hack/PopUp.dart';
import 'package:schedule_hack/JsonDataStorage.dart';

import 'package:schedule_hack/SelfCare.dart';
import 'package:schedule_hack/utilities.dart';

import 'Calendar.dart';
import 'Schedule.dart';

class CalendarHome extends StatefulWidget {
  int index;
  bool calendarView;
  CalendarHome(int i, bool v) {
    this.index = i;
    this.calendarView = v;
  }

  @override
  State<StatefulWidget> createState() {
    return _CalendarHomeState(this.index, this.calendarView);
  }
}

class _CalendarHomeState extends State<CalendarHome> {
  int _currentIndex = 0;
  JsonDataStorage jsonDataStorage = new JsonDataStorage();
  List<Widget> _children = new List<Widget>();
  bool calendarView;

  _CalendarHomeState(int i, bool v) {
    this._currentIndex = i;
    this.calendarView = v;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
      //{
      future: jsonDataStorage.writeJsonLocal(), //fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          //snapshot.hasData) {
          print('Has data');
          if (calendarView == true) {
            calendarView = false;
            this._children = [
              Calendar(),
              SelfCare(),
              CourseList(jsonDataStorage),
            ];
          } else {
            this._children = [
              Schedule([
                new Activity.test("Study", 0),
                new Activity.test("Attend Class", 2),
                new Activity.test("Sleep", 4)
              ]),
              SelfCare(),
              CourseList(jsonDataStorage),
            ];
          }
          return showDisplay();
        } else {
          // show loading until data comes back
          print('getting data');
          return CircularProgressIndicator();
        }
      });

  Widget showDisplay() {
    return Scaffold(
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorHoneydew,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/schedule.png"),
              color: colorBlackCoral,
            ),
            label: 'Schedule',
          ),
          new BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/self_care.png"),
              color: colorBlackCoral,
            ),
            label: 'Self-Care',
          ),
          new BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/classroom.png"),
                color: colorBlackCoral,
              ),
              label: 'Courses')
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
