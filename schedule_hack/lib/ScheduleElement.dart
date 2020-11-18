import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/ScheduleEvent.dart';
import 'package:schedule_hack/utilities.dart';

class ScheduleElement extends StatelessWidget {
  ScheduleEvent scheduleEvent;

  ScheduleElement(ScheduleEvent scheduleEvent) {
    this.scheduleEvent = scheduleEvent;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(10),
      // child: Container(
      //   color: colorPale,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Image(image: AssetImage(img)),
      //       Text(event + ' ' + time),
      //       Icon(Icons.arrow_forward_ios),
      //     ],
      //   ),
      // ),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: null,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: colorPale,
          ),
          // color: colorPale,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage(scheduleEvent.img)),
              Text(scheduleEvent.title),
              Text(scheduleEvent.interval),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
