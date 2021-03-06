import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activities.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/ActivityDataSource.dart';
import 'package:schedule_hack/AppStorage.dart';
import 'package:schedule_hack/CourseList.dart';
import 'package:schedule_hack/PopUp.dart';
import 'package:schedule_hack/JsonDataStorage.dart';

import 'package:schedule_hack/SelfCare.dart';
import 'package:schedule_hack/utilities.dart';

import 'Schedule.dart';

class Home extends StatefulWidget {
  int index;
  List<Activity> activitylist;

  Home(int i) {
    this.index = i;
  }

  Home.schedule(int i, List<Activity> list){
    this.index = i;
    this.activitylist = list;
  }

  @override
  State<StatefulWidget> createState() {
    return _HomeState(this.index);
  }
}

class _HomeState extends State<Home> with AppStorage {
  int _currentIndex = 0;
  JsonDataStorage jsonDataStorage = new JsonDataStorage();
  final LocalStorage _scheduleStorage = new LocalStorage('schedule.json');
  List<Activity> _dayActivities = new List<Activity>();
  ActivityDataSource _activityDataSource;
  List<Widget> _children = new List<Widget>();
  List<Activity> activityList;

  _HomeState(int i) {
    this._currentIndex = i;
   // this.activityList = list;
  }

  @override
  void initState() {
    _activityDataSource = new ActivityDataSource(_dayActivities);

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
          this._children = [
            Schedule(_activityDataSource.appointments),
          //  Schedule(this.activityList),
            SelfCare(),
            CourseList(jsonDataStorage),
          ];
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

class HomeNoti extends Home {
  HomeNoti(int i) : super(i);

  @override
  State<StatefulWidget> createState() {
    return _HomeNotiState(0);
  }
}

class _HomeNotiState extends _HomeState {
  _HomeNotiState(int i) : super(i);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
          context: context, builder: (BuildContext context) => MidPopUp());
    });
  }

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}
