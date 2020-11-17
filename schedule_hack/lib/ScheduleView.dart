import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/utilities.dart';
import 'ScheduleElement.dart';

class ScheduleView extends StatelessWidget {
  ScheduleView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(24.0),
        child: Row(
          children: [SchduleElement()],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        width: 300,
        height: 75,
        decoration: BoxDecoration(color: colorPowderBlue),
      ),
    );
  }
}
