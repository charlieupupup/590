import 'package:flutter/cupertino.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/Course.dart';
import 'package:schedule_hack/PlaceHolderWidget.dart';


// Course button UI element
class CourseButton extends StatefulWidget {
  String courseName;
  int colorCount;
  Course course;

  CourseButton(Course c, int count) {
    this.course = c;
    this.courseName = c.getName;
    this.colorCount = count;
  }

  @override
  State<StatefulWidget> createState() {
    return _CourseButtonState(course, colorCount);
  }
}

  class _CourseButtonState extends State<CourseButton>{
  int colorCount;
  String courseName;
  Course course;
  _CourseButtonState(Course c, int count){
    this.course = c;
    this.courseName = c.getName;
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
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              color: returnColor(colorCount),
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
                    MaterialButton(onPressed: (){

                      },
                        color: colorMelon,
                        child: Image.asset(
                          'images/delete.png',
                          height: 50,
                          width: 50,
                        ),
                      shape: CircleBorder()
                    ),
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