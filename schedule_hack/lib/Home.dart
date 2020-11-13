import 'package:flutter/material.dart';
import 'package:schedule_hack/CourseList.dart';
import 'package:schedule_hack/JsonDataStorage.dart';

import 'package:schedule_hack/SelfCare.dart';
import 'package:schedule_hack/utilities.dart';

import 'Notify.dart';

import 'Schedule.dart';

class Home extends StatefulWidget {
  int index;
  Home(int i) {
    this.index = i;
  }

  @override
  State<StatefulWidget> createState() {
    Notify n = new Notify();
    n.notify();
    return _HomeState(this.index);
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  JsonDataStorage jsonDataStorage = new JsonDataStorage();
  List<Widget> _children = new List<Widget>();
  _HomeState(int i) {
    this._currentIndex = i;
  }
  /*final List<Widget> _children = [
    Schedule(
        title: 'ScheduleHack',
        date: DateTime.now() //initialize with today's date
        ),
    SelfCare(),
    CourseList(jsonDataStorage),
  ];*/


  @override
  Widget build(BuildContext context) => FutureBuilder( //{
      future: jsonDataStorage.writeJsonLocal(),//fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done){//snapshot.hasData) {
          print('Has data');
          this._children = [
            Schedule(
                title: 'ScheduleHack',
                date: DateTime.now() //initialize with today's date
            ),
            SelfCare(),
            CourseList(jsonDataStorage),
          ];
          return showDisplay();
        } else {
          // show loading until data comes back
          print('getting data');
          return CircularProgressIndicator();
        }
      }
  );

  Widget showDisplay(){
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
    /*return Scaffold(
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
    );*/
  //}

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
