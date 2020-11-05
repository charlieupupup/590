import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:schedule_hack/Assignment.dart';
import 'package:schedule_hack/CancelButton.dart';
import 'package:schedule_hack/CheckmarkButton.dart';
import 'package:schedule_hack/Course.dart';
import 'package:schedule_hack/CourseButton.dart';
import 'package:schedule_hack/JsonDataStorage.dart';
import 'package:schedule_hack/SettingsButton.dart';
import 'package:schedule_hack/NewCoursePopup.dart';
import 'package:schedule_hack/utilities.dart';

class CourseList extends StatefulWidget {
  List<dynamic> courseList = new List();
  JsonDataStorage jsonDataStorage = new JsonDataStorage();

  CourseList(){
    jsonDataStorage.writeJsonLocal();
  }
  @override
  State<StatefulWidget> createState() {
    return new _CourseListState(courseList, jsonDataStorage);
  }
}
class _CourseListState extends State<CourseList> {
  final myController = TextEditingController();
  List<dynamic> courseList = new List();
  JsonDataStorage jsonDataStorage = new JsonDataStorage();

  _CourseListState(List<dynamic> cl, JsonDataStorage storage){
    this.courseList = cl;
    this.jsonDataStorage = storage;
    this.courseList = storage.getCourseList;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //this.jsonDataStorage = widget.jsonDataStorage;
    //this.courseList = jsonDataStorage.getCourseList;
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
      body: Container(
        child: ListView.builder(
            itemCount: courseList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                onDismissed: (DismissDirection direction) {
                  setState(() {
                    jsonDataStorage.deleteEntry(index);
                    courseList.removeAt(index);
                  });
                },
                //background: Container(),
               // child: MovieCard(movie: movies[index]),
                //child: getCourseButtonWidgets(),
                child: tempCourseButton(index),
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
              );
            }
        ),
        /*child: ListView(
          children: <Widget>[
            getCourseButtonWidgets()
          ],
        ),*/
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
  updateUI(List<dynamic> newStorage){
    setState(() {
      this.courseList = newStorage;
    });
  }
  // Display course button based on json input
  Widget getCourseButtonWidgets(){
    List<Widget> list = new List<Widget>();
    //print('CourseList Length:  $courseList.length');
    for (int i = 0; i < courseList.length; i++) {
      Course course = Course.fromJson(courseList[i]);
        list.add(new CourseButton(course, i, updateUI));
    }
    return new Column(children: list);
  }

  Widget tempCourseButton(int index){
    Course course = Course.fromJson(courseList[index]);
    return CourseButton(course, index, updateUI);
  }


}
