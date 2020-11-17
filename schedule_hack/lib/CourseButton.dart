import 'package:flutter/cupertino.dart';
import 'package:schedule_hack/Assignment.dart';
import 'package:schedule_hack/JsonDataStorage.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/Course.dart';
import 'package:schedule_hack/PlaceHolderWidget.dart';

import 'AssignmentListHome.dart';

//import 'package:schedule_hack/_CourseListState.dart';
// Course button UI element
class CourseButton extends StatefulWidget {
  String courseName;
  int courseCount;
  Course course;
  //final ValueChanged<List<dynamic>> parentAction;

  CourseButton(Course c, int count) {
    this.course = c;
    this.courseName = c.getName;
    this.courseCount = count;
  }

  @override
  State<StatefulWidget> createState() {
    return new _CourseButtonState(course, courseCount);
  }
}

class _CourseButtonState extends State<CourseButton> {
  int courseCount;
  String courseName;
  Course course;
  JsonDataStorage jsonDataStorage = new JsonDataStorage();
  _CourseButtonState(Course c, int count) {
    this.course = c;
    this.courseName = c.getName;
    this.courseCount = count;
  }

  Color returnColor(int count) {
    List colorList = new List();
    colorList.add(colorPowderBlue);
    colorList.add(colorHoneydew);
    colorList.add(colorMelon);
    colorList.add(colorAlmond);
    if (count == 0) {
      return colorList[0];
    } else if (count % 4 == 0) {
      return colorList[0];
    } else if (count % 2 == 0) {
      return colorList[1];
    } else if ((count + 1) % 4 == 0) {
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
            padding: const EdgeInsets.only(
              top: 3.0
            ),
            child: FlatButton(//RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
              ),
              color: returnColor(courseCount),
              onPressed: () {
                // delete entry because going to add updated entry later
                jsonDataStorage.deleteEntry(this.courseCount);
                List list = new List();
                list = this.course.getAssignments;
                List newList = new List();
                Assignment a = new Assignment();
                for (int i = 0; i < list.length; i++){
                  a = Assignment.fromJson(list[i]);
                  newList.add(a);
                }
                Course newCourse = Course.long(this.course.getName, this.course.getTime, this.course.getDate, this.course.getCourseDays, newList);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                     builder: (BuildContext context) => AssignmentListHome(2, newCourse,1,this.courseCount,1,newCourse),
                  ),
                      (route) => false,
                );
              },
              child: Container(
                margin: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      courseName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 24, color: colorBlackCoral),
                    )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                //width: 250,
               // height: 50,
              ),
            ),
          )
        ],
      ),
    );
  }
}
