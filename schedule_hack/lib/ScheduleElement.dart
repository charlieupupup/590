import 'package:flutter/material.dart';
import 'package:schedule_hack/Activity.dart';

import 'package:schedule_hack/utilities.dart';

import 'ScheduleElementDetail.dart';

class ScheduleElement extends StatelessWidget {
  Activity activity;

  //ScheduleElement(ScheduleEvent scheduleEvent) {
  ScheduleElement(Activity activity) {
    //this.scheduleEvent = scheduleEvent;
    this.activity = activity;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                return ScheduleElementDetail(activity);
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
              //Image(image: AssetImage(scheduleEvent.img)),
              activity.image,
              //Text(scheduleEvent.title),
              Text(activity.subject),
              //Text(scheduleEvent.interval),

              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
