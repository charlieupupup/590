import 'package:flutter/cupertino.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/Course.dart';

class CourseButton extends StatelessWidget {
  String courseName;
  int colorCount;

  CourseButton(Course course, int count) {
    this.courseName = course.getName;
    this.colorCount = count;
  }

  Color returnColor(int count){
    List colorList = new List();
    colorList.add(colorPowderBlue);
    colorList.add(colorMelon);
    colorList.add(colorAlmond);
    colorList.add(colorHoneydew);
    return colorList[count];
  }

  // Designing CourseButton (generic to name and color)
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              color: returnColor(colorCount),
              onPressed: (){
                // Respond to button press
              },
              child: Container(
                margin: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Expanded(child: Text(
                      courseName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 24, color: colorBlackCoral),
                    ))
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
