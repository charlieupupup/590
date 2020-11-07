import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/NewAssignmentPopup.dart';
import 'package:schedule_hack/utilities.dart';
import 'CourseList.dart';
import 'PlaceHolderWidget.dart';
import 'Schedule.dart';

import 'SettingsButton.dart';

// Class to display and interact with list of assignments
class AssignmentList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _AssignmentListState();
  }
}

class _AssignmentListState extends State<AssignmentList> {
  final myController = TextEditingController();
  int _currentIndex = 2;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios,
          color: colorBlackCoral,
        ),
        actions: [
          Row(
            children: [
              SettingsButton()
            ],
          ),
        ],
        title: Text('Assignments',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: colorBlackCoral)),
        backgroundColor: colorHoneydew,
      ),
      //body: _children[_currentIndex],
      //bottomNavigationBar: _navWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //NewCoursePopup(context, myController);
          // New assignment popup
          NewAssignmentPopup(context, myController);
        },
        backgroundColor: colorHoneydew,
        child: Image.asset('images/add.png'),
      ),
    );
  }

  // Bottom Navigation Bar Stuff
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  Widget _navWidget(){
    return BottomNavigationBar(
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
    );
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
}