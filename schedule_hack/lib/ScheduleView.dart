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
              Container(),
              // Expanded(child: SchduleElement()),
              Text(
                'My day',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                child: Icon(Icons.add),
              ),
              // Icon(Icons.add),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          width: 300,
          height: 75,
          decoration: BoxDecoration(
            color: colorPowderBlue,
            // borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
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
          height: 200,
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
