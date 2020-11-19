import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    Widget Start(Activity _activity) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Start:'),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Text(_activity.date.month.toString()),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Text(_activity.date.month.toString()),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Start:'),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Text(_activity.date.month.toString()),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Text(_activity.date.month.toString()),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('End: '),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Text(_activity.date.month.toString()),
                  ),
                ],
              ),
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
