import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/CancelButton.dart';
import 'package:schedule_hack/CheckNavButton.dart';
import 'package:schedule_hack/CheckmarkButton.dart';
import 'package:schedule_hack/DateSelector.dart';
import 'package:schedule_hack/utilities.dart';

class ScheduleModify extends StatelessWidget {
  Activity _activity;
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  ScheduleModify(Activity activity) {
    _activity = activity;
  }

  @override
  Widget build(BuildContext context) {
    String getDate(DateTime dateTime) {
      final df = new DateFormat('MMM dd, yyyy');
      return df.format(dateTime);
    }

    String getTime(DateTime dateTime) {
      final df = new DateFormat('hh:mm a');
      return df.format(dateTime);
    }

    Widget Start(Activity _activity) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Text('Start:'),
          ),

          Expanded(
            child: TextField(
              readOnly: true,
              controller: startDateController,
              decoration: InputDecoration(
                hintText: getDate(_activity.date),
                filled: true,
                fillColor: colorBeige,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorBlackCoral),
                ),
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
          ),
          SizedBox(
            width: 10.0,
          ),
          //),
          Expanded(
            child: TextField(
              readOnly: true,
              controller: startTimeController,
              decoration: InputDecoration(
                  hintText: getTime(_activity.date),
                  filled: true,
                  fillColor: colorBeige,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorBlackCoral),
                  ),
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
          ),
        ],
      );
    }

    Widget End(Activity _activity) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text('End:  '),
          ),
          Expanded(
            child: TextField(
              readOnly: true,
              controller: endDateController,
              decoration: InputDecoration(
                hintText: getDate(_activity.date),
                filled: true,
                fillColor: colorBeige,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorBlackCoral),
                ),
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
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: TextField(
              readOnly: true,
              controller: endTimeController,
              decoration: InputDecoration(
                  hintText: getTime(_activity.date),
                  filled: true,
                  fillColor: colorBeige,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorBlackCoral),
                  ),
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
                endTimeController.text = time.format(context);
              },
            ),
          ),
        ],
      );
    }

    return SimpleDialog(
      backgroundColor: colorPowderBlue,
      elevation: 16,
      children: [
        Container(
          //margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Text(
                'Modify Task',
                textScaleFactor: 1,
              ),
              Text(
                _activity.title,
                textScaleFactor: 2,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          width: 400,
          height: 75,
          decoration: BoxDecoration(
            color: colorPowderBlue,
            // borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        //SingleChildScrollView(
        //child: Container(
        Container(
          color: colorAeroBlue,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                Start(_activity),
                SizedBox(height: 10),
                End(_activity),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Details:'),
                    Text(''),
                    Text(''),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: 300,
                  height: 100,
                  //decoration: BoxDecoration(border: Border.all(color: colorBlackCoral)),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: colorBeige,
                      border: OutlineInputBorder(),
                      labelText: _activity.description,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [CancelButton(), CheckmarkButton.schedule(7)],
                ),
              ],
            ),
          ),
        )

        //),
      ],
      // title: Text(_activity.title),
    );
  }
}
