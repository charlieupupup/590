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
  TimeOfDay startTime;
  TimeOfDay endTime;

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

  Widget checkMark(int i, TextEditingController name,
      TextEditingController start, TextEditingController end) {
    return CheckmarkButton.course(i, name, start, end);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: colorBeige,
      elevation: 16,
      title: new Text('Course Name',
          style: TextStyle(
              fontSize: 24,
              color: colorBlackCoral,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center),
      content: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              new TextFormField(
                controller: nameController,
                decoration: new InputDecoration(hintText: 'Course Name'),
              ),
              TextField(
                readOnly: true,
                controller: startTimeController,
                decoration: InputDecoration(
                    hintText: 'Start Time',
                    suffixIcon: Icon(Icons.access_alarm)),
                onTap: () async {
                  var time = await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.from(colorScheme: setTimeColors()),
                        child: child,
                      );
                    },
                  );
                  if (time != null){
                    startTimeController.text = time.format(context);
                  }
                },
              ),
              TextField(
                readOnly: true,
                controller: endTimeController,
                decoration: InputDecoration(
                    hintText: 'End Time', suffixIcon: Icon(Icons.access_alarm)),
                onTap: () async {
                  var time = await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.from(colorScheme: setTimeColors()),
                        child: child,
                      );
                    },
                  );
                  if (time != null){
                    endTimeController.text = time.format(context);
                  }
                },
              ),
              // DaySelector(dayValues),
              // selectDayBoxes(),
              dayBoxesTest(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CancelButton(),
                  checkMark(
                      0, nameController, startTimeController, endTimeController)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget showCaptions() {
    List<Widget> tiles = new List<Widget>();
    for (String day in dayValues.keys) {
      Text dayName = new Text(day,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.0, color: colorBlackCoral));
      tiles.add(dayName);
    }
    return new Row(
        children: tiles, mainAxisAlignment: MainAxisAlignment.spaceAround);
  }

  Widget dayBoxesTest() {
    List<Widget> tiles = new List<Widget>();
    for (String day in dayValues.keys) {
      tiles.add(Checkbox(
          value: dayValues[day],
          checkColor: colorBlackCoral,
          activeColor: colorPowderBlue,
          onChanged: (bool newValue) {
            setState(() {
              dayValues[day] = newValue;
            });
          }));
    }
    return new Column(
      children: <Widget>[
        new Row(
            children: tiles, mainAxisAlignment: MainAxisAlignment.spaceAround),
        showCaptions()
      ],
    );
  }

  Widget selectDayBoxes() {
    List<Widget> tiles = new List<Widget>();
    for (String day in dayValues.keys) {
      Expanded box = new Expanded(
          child: Checkbox(
              value: dayValues[day],
              checkColor: colorBlackCoral,
              activeColor: colorPowderBlue,
              onChanged: (bool newValue) {
                setState(() {
                  dayValues[day] = newValue;
                });
              }));
      tiles.add(box);
    }
    return new Column(
      children: <Widget>[
        new Flexible(child: showCaptions()),
        new Row(
            children: tiles, mainAxisAlignment: MainAxisAlignment.spaceAround),
      ],
    );
  }
}
