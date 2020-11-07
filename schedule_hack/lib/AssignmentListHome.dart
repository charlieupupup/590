import 'package:flutter/material.dart';
import 'package:schedule_hack/AssignmentList.dart';
import 'package:schedule_hack/CourseList.dart';
import 'package:schedule_hack/JsonDataStorage.dart';
import 'package:schedule_hack/utilities.dart';

import 'PlaceHolderWidget.dart';
import 'Schedule.dart';

class AssignmentListHome extends StatefulWidget {
  int index;
  AssignmentListHome(int i){
    this.index = i;
  }

  @override
  State<StatefulWidget> createState() {
    return _AssignmentListHomeState(this.index);
  }
}

class _AssignmentListHomeState extends State<AssignmentListHome> {
  int _currentIndex = 2;
  _AssignmentListHomeState(int i){
    this._currentIndex = i;
  }
  final List<Widget> _children = [
    Schedule(
        title: 'ScheduleHack',
        date: DateTime.now() //initialize with today's date
    ),
    PlaceholderWidget(
        colorMelon), //just placeholders until Self-Care and Courses widgets are made
    AssignmentList(),
  ];

  @override
  Widget build(BuildContext context) {
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
