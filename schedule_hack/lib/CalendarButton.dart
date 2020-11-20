import 'package:schedule_hack/CalendarViewOld.dart';
import 'package:schedule_hack/ScheduleCalendar.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalendarButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarButtonState();
  }
}

class _CalendarButtonState extends State<CalendarButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.calendar_today,
        color: colorBlackCoral,
      ),
      color: colorHoneydew,
      tooltip: 'calendar',
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ScheduleCalendar(0)));
      },
    );
  }
}
