import 'package:flutter/cupertino.dart';
import 'package:schedule_hack/CancelButton.dart';
import 'package:schedule_hack/CheckmarkButton.dart';

import 'package:schedule_hack/DaySelector.dart';
import 'package:schedule_hack/TimeSelector.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class NewCoursePopup extends StatefulWidget {
  BuildContext context;
  TextEditingController myController;
  NewCoursePopup(TextEditingController controller) {
    this.myController = controller;
  }
  @override
  State<StatefulWidget> createState() {
    return new _NewCoursePopupState(myController);
  }
}

class _NewCoursePopupState extends State<NewCoursePopup> {
  BuildContext context;
  TextEditingController myController;

  _NewCoursePopupState(TextEditingController controller) {
    this.myController = controller;
  }

  Widget checkMark(int i, TextEditingController s) {
    return CheckmarkButton.course(i, s);
  }

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      backgroundColor: colorBeige,
      elevation: 16,
      title: new Text('Course Name',
          style: TextStyle(
              fontSize: 24,
              color: colorBlackCoral,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center),
      content: Container(
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: new TextField(
                controller: myController,
                decoration: new InputDecoration(hintText: 'Course Name'),
              ),
            ),
            DaySelector(),
            new Expanded(child: TimeSelector(hintText: 'Start Time')),
            new Expanded(child: TimeSelector(hintText: 'End Time')),
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: <Widget>[CancelButton(), checkMark(0, myController)],
          ),
        )
      ],
    );
  }
}
