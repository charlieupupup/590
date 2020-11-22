import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activity.dart';

import 'package:schedule_hack/utilities.dart';

import 'ScheduleElementDetail.dart';

class ScheduleElement extends StatelessWidget {
  Activity _activity;
  List<Activity> _dayActivities;
  LocalStorage scheduleStorage;

  ScheduleElement(Activity activity, List<Activity> dayActivities,
      LocalStorage localStorage) {
    this._activity = activity;
    this._dayActivities = dayActivities;
    this.scheduleStorage = localStorage;
  }

  @override
  Widget build(BuildContext context) {
    //print("Building schedule element " + scheduledActivity.description);
    return Padding(
      padding: EdgeInsets.all(10),
      child: MaterialButton(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {
          // Navigator.of(context).pop();
          showDialog(
              context: context,
              builder: (_) {
                return ScheduleElementDetail(
                    _activity, _dayActivities, scheduleStorage);
              });
        },
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ScheduleElementDetail(scheduledActivity),
        //   ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: colorPale,
          ),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _activity.image,
              ),
              Text(_activity.subject,
                  style: TextStyle(
                      fontSize: 20,
                      color: colorBlackCoral,
                      fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
