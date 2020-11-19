import 'package:flutter/material.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/CancelButton.dart';
import 'package:schedule_hack/CheckNavButton.dart';
import 'package:schedule_hack/CheckmarkButton.dart';

class ScheduleModify extends StatelessWidget {
  Activity _activity;

  ScheduleModify(Activity activity) {
    _activity = activity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text('Start:'),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(_activity.date.month.toString()),
              ),
            ],
          ),
          Row(),
          Text('Details:'),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Text(_activity.description),
          ),
          ButtonBar(
            children: [
              CancelButton(),
              CheckNavButton(),
            ],
          ),
        ],
      ),
    );
  }
}
