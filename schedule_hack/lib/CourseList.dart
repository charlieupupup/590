import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule_hack/Assignment.dart';
import 'package:schedule_hack/CancelButton.dart';
import 'package:schedule_hack/CheckmarkButton.dart';
import 'package:schedule_hack/Course.dart';
import 'package:schedule_hack/CourseButton.dart';
import 'package:schedule_hack/SettingsButton.dart';
import 'package:schedule_hack/NewCoursePopup.dart';
import 'package:schedule_hack/utilities.dart';

class CourseList extends StatefulWidget {
  List<dynamic> courseList = new List();

  CourseList(){
    parseJson();
  }
  Future<String>_loadFromAsset() async {
    return await rootBundle.loadString("data/courses.json");
  }
  // parse json (jsonDecode)
  Future parseJson() async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = jsonDecode(jsonString);
    print(jsonResponse[0]);
    print(jsonResponse[1]);
    Course person = Course.fromJson(jsonResponse[0]);
    print(person.getName);
    this.courseList = jsonResponse;
  }
  @override
  State<StatefulWidget> createState() {
    return _CourseListState(courseList);
  }
}
class _CourseListState extends State<CourseList> {
  final myController = TextEditingController();
  List<dynamic> courseList = new List();
  _CourseListState(List<dynamic> cl){
    this.courseList = cl;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              //Icon(Icons.settings, color: colorBlackCoral),
              SettingsButton()
            ],
          ),
        ],
        title: Text('Courses',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: colorBlackCoral)),
        backgroundColor: colorHoneydew,
      ),
      bottomNavigationBar: SizedBox(
        height: 58,
        //child: T.TabBar().build(context),
      ),
      body: Container(
        child: ListView(
          children: [
            getCourseButtonWidgets()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          NewCoursePopup(context, myController);
        },
        backgroundColor: colorHoneydew,
        child: Image.asset('images/add.png'),
      ),
    );
  }

  // Create Course
  Course createCourse(String name) {
    Course c1 = new Course();
    c1.setName = name;
    return c1;
  }
  // Display course button based on json input
  Widget getCourseButtonWidgets(){
    List<Widget> list = new List<Widget>();
    for (int i = 0; i < courseList.length; i++) {
      Course course = Course.fromJson(courseList[i]);
        list.add(new CourseButton(course, i));
    }
    return new Column(children: list);
  }
}
