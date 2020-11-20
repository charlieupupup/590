import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:schedule_hack/Activity.dart';

import 'package:schedule_hack/utilities.dart';

class ScheduleElement extends StatelessWidget {
  //ScheduleEvent scheduleEvent;
  Activity scheduledActivity;

  //ScheduleElement(ScheduleEvent scheduleEvent) {
  ScheduleElement(Activity scheduleEvent) {
    //this.scheduleEvent = scheduleEvent;
    this.scheduledActivity = scheduleEvent;
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
        onPressed: null,
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
              scheduledActivity.icon,
              //Text(scheduleEvent.title),
              Text(scheduledActivity.title),
              //Text(scheduleEvent.interval),

              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
