import 'package:schedule_hack/CourseList.dart';
import 'package:schedule_hack/Home.dart';
import 'package:schedule_hack/JsonDataStorage.dart';
import 'package:schedule_hack/SyllabusPopup.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:schedule_hack/Course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/PlaceHolderWidget.dart';


// Class that builds checkmark green button
// Takes in index to know where to pass user next depending on where used
class CheckmarkButton extends StatefulWidget {
  int index;
  String data;
  JsonDataStorage jsonDataStorage = new JsonDataStorage();
  TextEditingController myController;

  CheckmarkButton(int i){
    this.index = i;
  }
  CheckmarkButton.course(int i, TextEditingController d){
    this.index = i;
    this.myController = d;
  }
  @override
  State<StatefulWidget> createState() {
    return _CheckmarkButtonState(index, myController);
  }
}
class _CheckmarkButtonState extends State<CheckmarkButton>{
  int index;
  String data;
  JsonDataStorage jsonDataStorage = new JsonDataStorage();
  TextEditingController myController;

  _CheckmarkButtonState(int i, TextEditingController controller){
    this.index = i;
    this.myController = controller;
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
      onPressed: (){
        switch(index){
          case 0: {
            // take user to syllabus popup (showing manual, photo, pdf)
            this.data = myController.text;
            print("Data: :${data}");
            Course c1 = createCourse(data);
            jsonDataStorage.newEntry(c1);
            SyllabusPopup(context);
            break;
          }
          case 1: {
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
          default: {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>PlaceholderWidget(colorPowderBlue)));
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