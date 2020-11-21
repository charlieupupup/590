import 'package:flutter/material.dart';
import 'package:schedule_hack/Activity.dart';

import 'package:schedule_hack/utilities.dart';

import 'ScheduleElementDetail.dart';

class ScheduleElement extends StatelessWidget {
  Activity activity;

  ScheduleElement(Activity activity) {
    this.activity = activity;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: MaterialButton(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return ScheduleElementDetail(activity);
              });
        },
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
                child: activity.image,
              ),
              Text(activity.subject,
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