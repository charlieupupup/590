import 'package:schedule_hack/Course.dart';
import 'package:schedule_hack/StandardPopup.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Class that builds cancel (x) red button
// Takes in index to know where to pass user next depending on where used
class CancelButton extends StatefulWidget {
  int index = 0;
  Course course;
  CancelButton();
  // constructor for assignment cancel (doesn't take you back one page, instead takes you back to CourseList)
  CancelButton.assignment(int i,Course c){
    this.index = i;
    this.course = c;
  }
  @override
  State<StatefulWidget> createState() {
    if (this.index == 0){
      return _CancelButtonState();
    } else {
      return _CancelButtonState.assignment(this.index,this.course);
    }
  }
}
class _CancelButtonState extends State<CancelButton>{
  int index = 0;
  Course course;
  _CancelButtonState();
  _CancelButtonState.assignment(int i,Course c){
    this.index = i;
    this.course = c;
  }
    @override
    Widget build(BuildContext context) {
      return MaterialButton(
          onPressed: (){
            if (this.index == 0){
              // cancel just go back to last page (pop)
              Navigator.of(context).pop();
            } else {
              StandardPopup.course(context,'Going back now will not save all progress. Are you sure?',index,this.course);
            }
          },
        color: colorMelon,
        child: Image.asset(
          'images/delete.png',
          height: 50,
          width: 50,
        ),
        shape: CircleBorder(),
      );
    }
}
