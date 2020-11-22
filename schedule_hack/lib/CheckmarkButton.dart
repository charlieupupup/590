import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/AppStorage.dart';
import 'package:schedule_hack/Home.dart';
import 'package:schedule_hack/JsonDataStorage.dart';
import 'package:schedule_hack/SyllabusPopup.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:schedule_hack/Course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/PlaceHolderWidget.dart';
import 'package:schedule_hack/MockPhoto.dart';

import 'ConfirmPopup.dart';
import 'LoadingScreen.dart';

// Class that builds checkmark green button
// Takes in index to know where to pass user next depending on where used
class CheckmarkButton extends StatefulWidget with AppStorage {
  int index;
  String data;
  int edit;
  int courseCount;
  JsonDataStorage jsonDataStorage = new JsonDataStorage();
  TextEditingController nameController;
  Course course = new Course();
  TextEditingController startTimeController;
  TextEditingController endTimeController;
  TextEditingController dateController;

  CheckmarkButton(int i, Course c) {
    this.index = i;
    this.course = c;
  }
  CheckmarkButton.schedule(int i) {
    this.index = i;
  }
  CheckmarkButton.course(int i, TextEditingController name,
      TextEditingController sT, TextEditingController eT) {
    this.index = i;
    this.nameController = name;
    this.startTimeController = sT;
    this.endTimeController = eT;
  }
  CheckmarkButton.assignment(int i, Course c, int e, int cCount) {
    this.index = i;
    this.course = c;
    this.edit = e;
    this.courseCount = cCount;
  }
  @override
  State<StatefulWidget> createState() {
    return _CheckmarkButtonState(index, nameController, course, edit,
        courseCount, startTimeController, endTimeController, dateController);
  }
}

class _CheckmarkButtonState extends State<CheckmarkButton> {
  int index;
  String courseName;
  int edit;
  int courseCount;
  JsonDataStorage jsonDataStorage = new JsonDataStorage();

  TextEditingController nameController;
  Course course = new Course();
  TextEditingController startTimeController;
  TextEditingController endTimeController;
  TextEditingController dateController;

  _CheckmarkButtonState(
      int i,
      TextEditingController controller,
      Course c,
      int e,
      int cCount,
      TextEditingController sT,
      TextEditingController eT,
      TextEditingController date) {
    this.index = i;
    this.nameController = controller;
    this.course = c;
    this.edit = e;
    this.courseCount = cCount;
    this.startTimeController = sT;
    this.endTimeController = eT;
    this.dateController = date;
    print('Start Time Controller: $startTimeController');
    //print();
  }
  // Create Course
  Course createCourse(String name) {
    Course c1 = new Course();
    c1.setName = name;
    return c1;
  }

  // _testMethod() {
  //   // take user back to CourseList.dart view
  //   Navigator.pushAndRemoveUntil(
  //     context,
  //     MaterialPageRoute(builder: (BuildContext context) => Home(0)),
  //     (route) => false,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        switch (index) {
          case 0: // Take users to SyllabusPopup.dart
            {
              // take user to syllabus popup (showing manual, photo, pdf)
              this.courseName = nameController.text;
              print("Data: :${courseName}");
              Course c1 = createCourse(courseName);

              // Create Activity and pass throughout New Course Creation
              final now = new DateTime.now();
              //DateTime startTime = new DateTime(now.year, now.month, now.day, startTimeController.hour, startTimeController.minute);
              //DateTime endTime = new DateTime(now.year, now.month, now.day, endTimeController.hour, endTimeController.minute);
              //int hours = endTimeController.hour - startTimeController.hour;
              //int minutes = endTimeController.minute - startTimeController.minute;
              // new activity
              // Activity activity = new Activity.standard(
              //     now, Duration(hours: 2), "Break", "Take a stretch Break");
              // TODO: add activity syllabus
              SyllabusPopup(context, c1);
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
              /* Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => AssignmentListHome(2, this.course,edit,0)//AssignmentList(),
                ),
                    (route) => false,
              );*/
              print(
                  'Case 3 in Checkmark button is in fact being used, fix me!!!');
              break;
            }
          case 4: // take user to Home(2) - CourseList (save data) **doesn't work b/c previous issues, go
            // Home(0) for now (back to schedule view
            {
              // add data to json
              //jsonDataStorage.newEntry(this.course);
              ConfirmPopup.course(
                  context,
                  'Great, your assignments will be saved. We are working in the '
                  'background to build your schedule. You can always edit a course later.',
                  5,
                  this.course,
                  this.edit);
              break;
            }
          case 5: // take user to Home(2) - CourseList (save data) **doesn't work b/c previous issues, go
            // Home(0) for now (back to schedule view
            {
              // add data to json
              if (this.edit == 1) {
                // edit not new
                // jsonDataStorage.deleteEntry(this.courseCount);
                jsonDataStorage.newEntry(this.course);
                // jsonDataStorage.editEntry(this.courseCount, this.course);
              } else {
                // new entry
                jsonDataStorage.newEntry(this.course);
              }

              // take user back to CourseList.dart view
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => LoadingScreen() //Home(0)
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
                MaterialPageRoute(builder: (BuildContext context) => Home(2)),
                (route) => false,
              );
              break;
            }
          case 7:
            {
              //jsonDataStorage.newEntry(this.course);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (BuildContext context) => Home(0)),
                (route) => false,
              );
              break;
            }
          case 8:
            {
              // do nothing, just indicate saw message
              Navigator.of(context).pop();
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
