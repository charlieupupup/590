import 'package:flutter/material.dart';
import 'package:schedule_hack/AssignmentList.dart';
import 'package:schedule_hack/Course.dart';
import 'package:schedule_hack/CourseList.dart';
import 'package:schedule_hack/JsonDataStorage.dart';
import 'package:schedule_hack/utilities.dart';

import 'PlaceHolderWidget.dart';
import 'Schedule.dart';
import 'SelfCare.dart';

class AssignmentListHome extends StatefulWidget {
  int index;
  Course course;
  int edit;
  int courseCount;
  int viewingAssignment;
  Course originalCourse;

  AssignmentListHome(int i,Course c,int e, int cCount, int vA, Course oC){
    this.index = i;
    this.course = c;
    this.edit = e;
    this.courseCount = cCount;
    this.viewingAssignment = vA;
    this.originalCourse = oC;
  }

  @override
  State<StatefulWidget> createState() {
    return _AssignmentListHomeState(this.index,this.course,this.edit,this.courseCount, this.viewingAssignment,this.originalCourse);
  }
}

class _AssignmentListHomeState extends State<AssignmentListHome> {
  int _currentIndex = 2;
  Course course;
  int edit;
  int courseCount;
  List<Widget> _children = new List<Widget>();
  int viewingAssignment;
  Course originalCourse;

  _AssignmentListHomeState(int i,Course c, int e, int cCount,int vA, Course oC){
    this._currentIndex = i;
    this.course = c;
    this.edit = e;
    this.courseCount = cCount;
    this.viewingAssignment = vA;
    this.originalCourse = oC;
    this._children = [
      Schedule(
          title: 'ScheduleHack',
          date: DateTime.now() //initialize with today's date
      ),
      SelfCare(),
      AssignmentList(this.course,this.edit,this.courseCount,this.viewingAssignment,this.originalCourse)//just placeholders until Self-Care and Courses widgets are made
    ];
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
