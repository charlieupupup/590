import 'package:flutter/material.dart';
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
  TextEditingController myController = TextEditingController();
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
                child: tempCourseButton(index),
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
              );
            }
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
  /*updateUI(List<dynamic> newStorage){
    setState(() {
      this.courseList = newStorage;
    });
  }*/
  // Display course button based on json input
  Widget getCourseButtonWidgets(){
    List<Widget> list = new List<Widget>();
    //print('CourseList Length:  $courseList.length');
    for (int i = 0; i < courseList.length; i++) {
      Course course = Course.fromJson(courseList[i]);
        list.add(new CourseButton(course, i));
    }
    return new Column(children: list);
  }

  Widget tempCourseButton(int index){
    Course course = Course.fromJson(courseList[index]);
    String courseName = course.getName;
    print('Course Button Troubleshoot: $courseName');
    int len = courseList.length;
    print('Length: $len');
    return CourseButton(course, index);
  }


}
