import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/CancelButton.dart';
import 'package:schedule_hack/CheckNavButton.dart';
import 'package:schedule_hack/ScheduleModify.dart';
import 'package:schedule_hack/utilities.dart';

class ScheduleElementDetail extends StatelessWidget {
  Activity _activity;

  ScheduleElementDetail(Activity activity) {
    _activity = activity;
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Column(
    //     children: [
    //       Row(
    //         children: [
    //           Text('Start:'),
    //           Container(
    //             decoration:
    //                 BoxDecoration(border: Border.all(color: Colors.black)),
    //             child: Text(_activity.date.month.toString()),
    //           ),
    //         ],
    //       ),
    //       Row(),
    //       Text('Details:'),
    //       Container(
    //         decoration: BoxDecoration(border: Border.all(color: Colors.black)),
    //         child: Text(_activity.description),
    //       ),
    //       ButtonBar(
    //         children: [
    //           CancelButton(),
    //           CheckNavButton(),
    //         ],
    //       ),
    //     ],
    //   ),
    // );

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
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            // child: Text(_activity.date.month.toString() +
            //     '/' +
            //     _activity.date.day.toString() +
            //     ',   ' +
            //     _activity.date.year.toString()),

            child: (Text(
              getDate(_activity.date),
              style: _style(),
            )),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            // child: Text(_activity.date.month.toString()),
            child: Text(
              getTime(_activity.date),
              style: _style(),
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
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Text(
              getDate(_activity.endDate),
              style: _style(),
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Text(
              getTime(_activity.endDate),
              style: _style(),
            ),
          ),
        ],
      );
    }

    return SimpleDialog(
      backgroundColor: colorPowderBlue,

      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Text(
                _activity.title,
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text('Start:'),
                //     Container(
                //       decoration:
                //           BoxDecoration(border: Border.all(color: Colors.black)),
                //       child: Text(_activity.date.month.toString()),
                //     ),
                //     Container(
                //       decoration:
                //           BoxDecoration(border: Border.all(color: Colors.black)),
                //       child: Text(_activity.date.month.toString()),
                //     ),
                //   ],
                // ),
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
                  width: 200,
                  height: 100,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Text(
                    _activity.description,
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
        ),
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
            // height: 50,
            // width: 50,
          ),
          Text('Modify'),
        ],
      ),
      // child: Image.asset(
      //   'images/edit.png',
      //   height: 50,
      //   width: 50,
      // ),
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
          // height: 50,
          // width: 50,
        ),
        Text('Delete'),
      ],
    ),
    // child: Image.asset(
    //   'images/edit.png',
    //   height: 50,
    //   width: 50,
    // ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
  );
}
