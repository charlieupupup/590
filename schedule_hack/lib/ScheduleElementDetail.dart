import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/ScheduleModify.dart';
import 'package:schedule_hack/utilities.dart';

class ScheduleElementDetail extends StatelessWidget {
  Activity _activity;

  ScheduleElementDetail(Activity activity) {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              'Start:',
            ),
          ),
          Expanded(
            child: TextField(
              readOnly: true,
              enabled: false,
              decoration: InputDecoration(
                hintText: getDate(_activity.startTime),
                filled: true,
                fillColor: colorBeige,
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorBlackCoral),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          //),
          Expanded(
            child: TextField(
              readOnly: true,
              enabled: false,
              decoration: InputDecoration(
                hintText: getTime(_activity.startTime),
                filled: true,
                fillColor: colorBeige,
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorBlackCoral),
                ),
              ),
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
              enabled: false,
              decoration: InputDecoration(
                hintText: getDate(_activity.endTime),
                filled: true,
                fillColor: colorBeige,
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorBlackCoral),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: TextField(
              readOnly: true,
              enabled: false,
              decoration: InputDecoration(
                hintText: getTime(_activity.endTime),
                filled: true,
                fillColor: colorBeige,
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorBlackCoral),
                ),
              ),
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
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Text(
                _activity.subject,
                textScaleFactor: 2,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          width: 400,
          height: 75,
          decoration: BoxDecoration(
            color: colorPowderBlue,
          ),
        ),
        //SingleChildScrollView(
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
                // Text('Details:'),
                Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                    color: colorBeige,
                    border: Border.all(color: colorBlackCoral),
                  ),
                  child: Text(
                    _activity.notes,
                    style: _style(),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    delete(),
                    modify(context),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
      // title: Text(_activity.title),
    );
  }

  FlatButton modify(BuildContext context) {
    return FlatButton(
      onPressed: () {
        // Navigator.of(context).pop();
        showDialog(
            context: context,
            builder: (_) {
              return ScheduleModify(_activity);
            });
      },
      color: colorPowderBlue,
      child: Row(
        children: [
          Image.asset(
            'images/edit.png',
          ),
          Text('Modify'),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
    );
  }
}

TextStyle _style() {
  return TextStyle(color: Colors.grey);
}

FlatButton delete() {
  return FlatButton(
    onPressed: () {},
    color: colorMelon,
    child: Row(
      children: [
        Image.asset(
          'images/trashcan.png',
        ),
        Text('Delete'),
      ],
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
  );
}
