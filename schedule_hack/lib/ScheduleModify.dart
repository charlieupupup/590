import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/CancelButton.dart';
import 'package:schedule_hack/CheckNavButton.dart';
import 'package:schedule_hack/utilities.dart';

class ScheduleModify extends StatelessWidget {
  Activity _activity;

  ScheduleModify(Activity activity) {
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
            child: Text('Start:'),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            // child: Text(_activity.date.month.toString() +
            //     '/' +
            //     _activity.date.day.toString() +
            //     ',   ' +
            //     _activity.date.year.toString()),

            child: (Text(getDate(_activity.date))),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            // child: Text(_activity.date.month.toString()),
            child: Text(getTime(_activity.date)),
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
            child: Text(getDate(_activity.endDate)),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Text(getTime(_activity.endDate)),
          ),
        ],
      );
    }

    return AlertDialog(
      backgroundColor: colorPowderBlue,
      title: Text(_activity.title),
      content: SingleChildScrollView(
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
              Start(_activity),
              End(_activity),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Details:'), Text('')],
              ),
              // Text('Details:'),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(_activity.description),
              ),
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
    );
  }
}
