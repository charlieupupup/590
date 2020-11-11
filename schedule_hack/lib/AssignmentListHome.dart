import 'package:flutter/material.dart';
import 'package:schedule_hack/AssignmentList.dart';
import 'package:schedule_hack/Course.dart';
import 'package:schedule_hack/CourseList.dart';
import 'package:schedule_hack/JsonDataStorage.dart';
import 'package:schedule_hack/utilities.dart';

import 'PlaceHolderWidget.dart';
import 'Schedule.dart';

class AssignmentListHome extends StatefulWidget {
  int index;
  Course course;
  int edit;
  int courseCount;
  AssignmentListHome(int i,Course c,int e, int cCount){
    this.index = i;
    this.course = c;
    this.edit = e;
    this.courseCount = cCount;
  }

  @override
  State<StatefulWidget> createState() {
    return _AssignmentListHomeState(this.index,this.course,this.edit,this.courseCount);
  }
}

class _AssignmentListHomeState extends State<AssignmentListHome> {
  int _currentIndex = 2;
  Course course;
  int edit;
  int courseCount;
  List<Widget> _children = new List<Widget>();

  _AssignmentListHomeState(int i,Course c, int e, int cCount){
    this._currentIndex = i;
    this.course = c;
    this.edit = e;
    this.courseCount = cCount;
    this._children = [
      Schedule(
          title: 'ScheduleHack',
          date: DateTime.now() //initialize with today's date
      ),
      PlaceholderWidget(
          colorMelon),
      AssignmentList(this.course,this.edit,this.courseCount)//just placeholders until Self-Care and Courses widgets are made
    ];
    if (this.edit == 0){
      _children.add(AssignmentList(this.course,this.edit,this.courseCount));
    } else if (this.edit == 1) {
      _children.add(AssignmentList.viewing(this.course,this.edit,this.courseCount,1));
    }
  }

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
