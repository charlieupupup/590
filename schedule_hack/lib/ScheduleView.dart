import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/Activity.dart';

import 'package:schedule_hack/utilities.dart';
import 'ScheduleElement.dart';

class ScheduleView extends StatelessWidget {
  //List<ScheduleEvent> _list;
  List<Activity> _list;

  ScheduleView(List<Activity> list) {
    //_list = list;
    Activity a0 = new Activity.fromIso8601(
        DateTime(2020, 11, 4, 1).toIso8601String(),
        DateTime(2020, 11, 4, 3).toIso8601String(),
        "ECE590",
        "Attend ECE564");
    Activity a1 = new Activity.fromIso8601(
        DateTime(2020, 11, 7, 2).toIso8601String(),
        DateTime.now().toIso8601String(),
        "ECE564",
        "Final Project");
    Activity a2 = new Activity.fromIso8601(
        DateTime(2020, 11, 12, 2).toIso8601String(),
        DateTime.now().toIso8601String(),
        "ECE551",
        "Final Presentation");
    _list = [a0, a1, a2];
  }

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
              Text(
                'My Day',
                style: TextStyle(color: colorIvory),
                textScaleFactor: 2,
              ),
              Container(
                child: FloatingActionButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          //return NewCoursePopup(nameController, startTimeController, endTimeController);
                          return;
                        });
                  },
                  backgroundColor: colorAeroBlue, //colorHoneydew,
                  child: Image.asset('images/add.png'),
                ),
              ),
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
        for (var scheduleEvent in _list)
          Container(
            // margin: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Expanded(child: ScheduleElement(scheduleEvent)),
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
