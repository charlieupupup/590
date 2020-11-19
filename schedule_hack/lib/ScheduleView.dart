import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/Activity.dart';

import 'package:schedule_hack/utilities.dart';
import 'ScheduleElement.dart';

class ScheduleView extends StatelessWidget {
  //List<ScheduleEvent> _list;
  List<ActivityOld> _list;

  ScheduleView(List<ActivityOld> list) {
    _list = list;
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
                style: TextStyle(color: Colors.white),
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
                  backgroundColor: colorHoneydew,
                  child: Image.asset('images/add.png'),
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
