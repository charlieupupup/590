import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/ScheduleEvent.dart';
import 'package:schedule_hack/utilities.dart';
import 'ScheduleElement.dart';

class ScheduleView extends StatelessWidget {
  ScheduleView({Key key}) : super(key: key);
  ScheduleEvent scheduleEvent = ScheduleEvent(
      'images/running.png', 'soccer', '3 - 5 pm', DateTime(2020, 11, 1));
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
                textScaleFactor: 2,
              ),
              Container(
                // child: Icon(Icons.add),
                child: IconButton(
                  icon: ImageIcon(
                    AssetImage('images/add.png'),
                  ),
                  onPressed: null,
                ),
              ),
              // Icon(Icons.add),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              Expanded(child: SchduleElement(scheduleEvent)),
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
