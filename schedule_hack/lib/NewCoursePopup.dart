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
  TextEditingController nameController;
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  Map<String, bool> dayValues = {
    //'Sunday': false,
    'M': false,
    'T': false,
    'W': false,
    'Th': false,
    'F': false,
    //'Saturday': false,
  };
  NewCoursePopup(TextEditingController controller, TextEditingController start,
      TextEditingController end) {
    this.nameController = controller;
    this.startTimeController = start;
    this.endTimeController = end;
  }
  @override
  State<StatefulWidget> createState() {
    return new _NewCoursePopupState(
        nameController, dayValues, startTimeController, endTimeController);
  }
}

class _NewCoursePopupState extends State<NewCoursePopup> {
  BuildContext context;
  TextEditingController nameController;
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  Map<String, bool> dayValues;
  _NewCoursePopupState(
      TextEditingController controller,
      Map<String, bool> dayVs,
      TextEditingController start,
      TextEditingController end) {
    this.nameController = controller;
    this.dayValues = dayVs;
    this.startTimeController = start;
    this.endTimeController = end;
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
                controller: nameController,
                decoration: new InputDecoration(hintText: 'Course Name'),
              ),
            ),
            DaySelector(dayValues),
            new Expanded(
              child: TimeSelector(
                  hintText: 'Start Time', timeController: startTimeController),
            ),
            new Expanded(
                child: TimeSelector(
                    hintText: 'End Time', timeController: endTimeController)),
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: <Widget>[CancelButton(), checkMark(0, nameController)],
          ),
        )
      ],
    );
  }
}
