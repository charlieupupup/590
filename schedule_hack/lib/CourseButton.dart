import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:schedule_hack/JsonDataStorage.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/Course.dart';
import 'package:schedule_hack/PlaceHolderWidget.dart';

import 'Home.dart';
//import 'package:schedule_hack/_CourseListState.dart';
// Course button UI element
class CourseButton extends StatefulWidget {
  String courseName;
  int courseCount;
  Course course;
  final ValueChanged<List<dynamic>> parentAction;

  CourseButton(Course c, int count, this.parentAction) {
    this.course = c;
    this.courseName = c.getName;
    this.courseCount = count;
  }

  @override
  State<StatefulWidget> createState() {
    return new _CourseButtonState(course, courseCount);
  }
}

  class _CourseButtonState extends State<CourseButton>{
  int courseCount;
  String courseName;
  Course course;
  JsonDataStorage jsonDataStorage = new JsonDataStorage();
  _CourseButtonState(Course c, int count){
    this.course = c;
    this.courseName = c.getName;
    this.courseCount = count;
  }

  Color returnColor(int count){
    List colorList = new List();
    colorList.add(colorPowderBlue);
    colorList.add(colorHoneydew);
    colorList.add(colorMelon);
    colorList.add(colorAlmond);
    if (count == 0){
      return colorList[0];
    } else if (count%4 == 0){
      return colorList[0];
    } else if (count%2 == 0){
      return colorList[1];
    } else if ((count+1)%4 == 0){
      return colorList[3];
    } else {
      return colorList[2];
    }
  }

  // Designing CourseButton (generic to name and color)
  @override
  Widget build(BuildContext context) {
    // reload constructor
    this.courseName = widget.courseName;
    this.courseCount = widget.courseCount;
    return new Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              color: returnColor(courseCount),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>PlaceholderWidget(colorPowderBlue)));
              },
              child: Container(
                margin: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Expanded(child: Text(
                      courseName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 24, color: colorBlackCoral),
                      )
                    ),
                   /* MaterialButton(onPressed: (){
                        //jsonDataStorage.deleteEntry(courseCount); // delete from json file
                       // widget.parentAction(jsonDataStorage.getJustCourseList);
                        setState(() {
                          jsonDataStorage.deleteEntry(courseCount);
                        });
                        /*Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(2),
                          ),
                        );*/
                      },
                        color: colorMelon,
                        child: Image.asset(
                          'images/trashcan.png',
                          height: 50,
                          width: 50,
                        ),
                      shape: CircleBorder()
                    ),*/
                    MaterialButton(onPressed: (){

                      },
                        color: colorAlmond,
                        child: Image.asset(
                          'images/edit.png',
                          height: 50,
                          width: 50,
                        ),
                        shape: CircleBorder()
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                width: 250,
                height: 50,
              ),
            ),
          )
        ],
      ),
    );
  }
}
