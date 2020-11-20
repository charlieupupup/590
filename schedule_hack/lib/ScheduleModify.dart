import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/CancelButton.dart';
import 'package:schedule_hack/CheckNavButton.dart';
import 'package:schedule_hack/DateSelector.dart';
import 'package:schedule_hack/ScheduleEvent.dart';
import 'package:schedule_hack/utilities.dart';

class ScheduleModify extends StatelessWidget {
  ScheduleEvent _activity;

  ScheduleModify(ScheduleEvent activity) {
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

    Widget Start(ScheduleEvent _activity) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text('Start:'),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: (Text(getDate(_activity.startTime))),
          ),
          // Container(
          //   child: Column(
          //     children: [
          //       DateSelector(
          //         hintText: getDate(_activity.date),
          //       ),
          //     ],
          //   ),
          //   decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          // ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            // child: Text(_activity.date.month.toString()),
            child: Text(getTime(_activity.startTime)),
          ),
        ],
      );
    }

    Widget End(ScheduleEvent _activity) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text('End:  '),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Text(getDate(_activity.endTime)),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Text(getTime(_activity.endTime)),
          ),
        ],
      );
    }

    return SimpleDialog(
      backgroundColor: colorPowderBlue,

      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Text(
                'modify',
                textScaleFactor: 1,
              ),
              Text(
                _activity.subject,
                textScaleFactor: 2,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          width: 300,
          height: 75,
          decoration: BoxDecoration(
            color: colorPowderBlue,
            // borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            color: colorAeroBlue,
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
                  width: 200,
                  height: 100,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: _activity.notes,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CancelButton(),
                    CheckNavButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
      // title: Text(_activity.title),
    );
  }
}
