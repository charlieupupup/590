import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/utilities.dart';
import 'ScheduleElement.dart';

class ScheduleView extends StatelessWidget {
  ScheduleView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              // Expanded(child: SchduleElement()),
              Text(
                'My day',
                style: TextStyle(color: Colors.white),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          width: 300,
          height: 75,
          decoration: BoxDecoration(color: colorPowderBlue),
        ),
        Container(
          // margin: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(child: SchduleElement()),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          width: 300,
          height: 75,
          decoration: BoxDecoration(color: colorAeroBlue),
        ),
        Container(
          // margin: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(child: SchduleElement()),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          width: 300,
          height: 75,
          decoration: BoxDecoration(color: colorAeroBlue),
        ),
        Container(
          // margin: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(child: SchduleElement()),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          width: 300,
          height: 75,
          decoration: BoxDecoration(color: colorAeroBlue),
        ),
        //
      ],
    );
    // return Column(
    //   children: [SchduleElement()],
    // );
  }
}
