import 'package:flutter/material.dart';
import 'package:schedule_hack/Course.dart';
import 'package:schedule_hack/CourseButton.dart';
import 'package:schedule_hack/JsonDataStorage.dart';
import 'package:schedule_hack/SettingsButton.dart';
import 'package:schedule_hack/NewCoursePopup.dart';
import 'package:schedule_hack/utilities.dart';

import 'CancelButton.dart';
import 'Home.dart';
import 'Schedule.dart';

class CourseList extends StatefulWidget {
  List<dynamic> courseList = new List();
  JsonDataStorage jsonDataStorage = new JsonDataStorage();

  CourseList(JsonDataStorage js) {
    //jsonDataStorage.writeJsonLocal();
    this.jsonDataStorage = js;
    print('CONSTRUCTOR CALLLLLLLLINIIINNNNGNGNGNG');
  }

  CourseList.course(JsonDataStorage js) {
    this.jsonDataStorage = js;
    this.jsonDataStorage.writeJsonLocal();
  }

  @override
  State<StatefulWidget> createState() {
    return new _CourseListState(courseList, jsonDataStorage);
    //return new _CourseListState(jsonDataStorage.getCourseList, jsonDataStorage);
  }
}

class _CourseListState extends State<CourseList> {
  TextEditingController myController = TextEditingController();
  List<dynamic> courseList = new List();
  JsonDataStorage jsonDataStorage = new JsonDataStorage();

  _CourseListState(List<dynamic> cl, JsonDataStorage storage) {
    this.jsonDataStorage = storage;
    this.courseList = storage.getJustCourseList;
  }

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
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: colorBlackCoral,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(0),
                ),
              );
            }),
        actions: [
          Row(
            children: [SettingsButton()],
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
                background: deleteBackground(), //Container(color: Colors.red),
                onDismissed: (DismissDirection direction) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("Course deleted")));
                  setState(() {
                    jsonDataStorage.deleteEntry(index);
                    courseList.removeAt(index);
                  });
                },
                child: tempCourseButton(index),
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return NewCoursePopup(myController);
              });
        },
        backgroundColor: colorHoneydew,
        child: Image.asset('images/add.png'),
      ),
    );
  }

  // Delete Dismissible background
  Widget deleteBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
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
  Widget getCourseButtonWidgets() {
    List<Widget> list = new List<Widget>();
    //print('CourseList Length:  $courseList.length');
    for (int i = 0; i < courseList.length; i++) {
      Course course = Course.fromJson(courseList[i]);
      list.add(new CourseButton(course, i));
    }
    return new Column(children: list);
  }

  Widget tempCourseButton(int index) {
    Course course = Course.fromJson(courseList[index]);
    String courseName = course.getName;
    print('Course Button Troubleshoot: $courseName');
    int len = courseList.length;
    print('Length: $len');
    return CourseButton(course, index);
  }
}
