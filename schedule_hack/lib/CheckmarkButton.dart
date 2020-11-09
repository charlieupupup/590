import 'package:schedule_hack/AssignmentList.dart';
import 'package:schedule_hack/Home.dart';
import 'package:schedule_hack/JsonDataStorage.dart';
import 'package:schedule_hack/StandardPopup.dart';
import 'package:schedule_hack/SyllabusPopup.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:schedule_hack/Course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/PlaceHolderWidget.dart';
import 'package:schedule_hack/MockPhoto.dart';

import 'AssignmentListHome.dart';
import 'ConfirmPopup.dart';

// Class that builds checkmark green button
// Takes in index to know where to pass user next depending on where used
class CheckmarkButton extends StatefulWidget {
  int index;
  String data;
  JsonDataStorage jsonDataStorage = new JsonDataStorage();
  TextEditingController myController;
  Course course = new Course();

  CheckmarkButton(int i, Course c) {
    this.index = i;
    this.course = c;
  }
  CheckmarkButton.course(int i, TextEditingController d) {
    this.index = i;
    this.myController = d;
  }
  @override
  State<StatefulWidget> createState() {
    return _CheckmarkButtonState(index, myController,course);
  }
}

class _CheckmarkButtonState extends State<CheckmarkButton> {
  int index;
  String data;
  JsonDataStorage jsonDataStorage = new JsonDataStorage();
  TextEditingController myController;
  Course course = new Course();

  _CheckmarkButtonState(int i, TextEditingController controller, Course c) {
    this.index = i;
    this.myController = controller;
    this.course = c;
  }
  // Create Course
  Course createCourse(String name) {
    Course c1 = new Course();
    c1.setName = name;
    return c1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        switch (index) {
          case 0:  // Take users to SyllabusPopup.dart
            {
              // take user to syllabus popup (showing manual, photo, pdf)
              this.data = myController.text;
              print("Data: :${data}");
              Course c1 = createCourse(data);
              // add new entry later
              //jsonDataStorage.newEntry(c1);
              SyllabusPopup(context,c1);
              break;
            }
          case 1: // Take users to MockPhoto.dart
            {
              // take user back to MockPhoto.dart view
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MockPhoto(this.course),
                ),
                (route) => false,
              );
              break;
            }
          case 2: // take users to Schedule.dart from Home.dart
            {
              // take user back to CourseList.dart view
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Home(0),
                ),
                    (route) => false,
              );
              break;
            }
          case 3: // take user to Assignments page for course
            {
              // take user back to CourseList.dart view
              //jsonDataStorage.newEntry(this.course);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => AssignmentListHome(2, this.course)//AssignmentList(),
                ),
                    (route) => false,
              );
              break;
            }
          case 4: // take user to Home(2) - CourseList (save data) **doesn't work b/c previous issues, go
          // Home(0) for now (back to schedule view
            {
              // add data to json
              //jsonDataStorage.newEntry(this.course);
              ConfirmPopup.course(context,'Great, your assignments will be saved. We are working in the '
                  'background to build your schedule. You can always edit a course later.',5,this.course);
              break;
            }
          case 5: // take user to Home(2) - CourseList (save data) **doesn't work b/c previous issues, go
          // Home(0) for now (back to schedule view
            {
              // add data to json
              jsonDataStorage.newEntry(this.course);

              // take user back to CourseList.dart view
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Home(0)
                ),
                    (route) => false,
              );
              break;
            }
          case 6: // take user to Home(2) - CourseList (save data) **doesn't work b/c previous issues, go
          // Home(0) for now (back to schedule view
            {
              // add data to json
              // take user back to CourseList.dart view
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Home(2)
                ),
                    (route) => false,
              );
              break;
            }
          case 7:
            {

              break;
            }
          default:
            {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PlaceholderWidget(colorPowderBlue)));
            }
        }
      },
      color: colorHoneydew,
      child: Image.asset(
        'images/checkmark.png',
        height: 50,
        width: 50,
      ),
      shape: CircleBorder(),
    );
  }
}
