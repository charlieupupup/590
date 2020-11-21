import 'package:flutter/cupertino.dart';
import 'package:schedule_hack/CancelButton.dart';
import 'package:schedule_hack/CheckmarkButton.dart';


import 'package:schedule_hack/utilities.dart';
import 'package:flutter/material.dart';


class AddScheduleEventPopup extends StatefulWidget {
  BuildContext context;
  TextEditingController nameController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  //AddScheduleEventPopup(TextEditingController controller, TextEditingController start, TextEditingController end) {
  AddScheduleEventPopup() {
    //this.nameController = controller;
    //this.startTimeController = start;
    //this.endTimeController = end;
  }
  @override
  State<StatefulWidget> createState() {
    return new _AddScheduleEventPopupState(
        noteController, startTimeController, endTimeController);
  }
}

class _AddScheduleEventPopupState extends State<AddScheduleEventPopup> {
  BuildContext context;
  TextEditingController nameController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  TimeOfDay startTime;
  TimeOfDay endTime;

  _AddScheduleEventPopupState(TextEditingController controller,
      TextEditingController start, TextEditingController end) {
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
      title: new Text('Create New Event',
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
                decoration: new InputDecoration(hintText: 'Add title'),
              ),
              TextField(
                readOnly: true,
                controller: startDateController,
                decoration: InputDecoration(
                  hintText: 'Start Date',
                  suffixIcon: Icon(Icons.calendar_today),
                  //filled: true,
                  //fillColor: colorBeige,
                  //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: colorBlackCoral),),
                ),
                onTap: () async {
                  var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.from(colorScheme: setDateColors()),
                        child: child,
                      );
                    },
                  );
                  startDateController.text = date
                      .toString()
                      .substring(0, 10); //save to json to send back out
                },
              ),
              TextField(
                readOnly: true,
                controller: endDateController,
                decoration: InputDecoration(
                  hintText: 'End Date',
                  suffixIcon: Icon(Icons.calendar_today),
                  //filled: true,
                  //fillColor: colorBeige,
                  //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: colorBlackCoral),),
                ),
                onTap: () async {
                  var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.from(colorScheme: setDateColors()),
                        child: child,
                      );
                    },
                  );
                  endDateController.text = date
                      .toString()
                      .substring(0, 10); //save to json to send back out
                },
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
                  startTimeController.text = time.format(context);
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
                  endTimeController.text = time.format(context);
                },
              ),
              new TextFormField(
                controller: noteController,
                decoration: new InputDecoration(hintText: 'Add notes'),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CancelButton(),
                  CheckmarkButton.schedule(7),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
