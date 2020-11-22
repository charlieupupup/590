import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/ActivityDataSource.dart';

import 'package:schedule_hack/utilities.dart';
import 'AddScheduleEventPopup.dart';
import 'ScheduleElement.dart';

class ScheduleView extends StatefulWidget {
  List<Activity> _dayActivities;
  LocalStorage scheduleStorage;
  ScheduleView(List<Activity> appointments, LocalStorage storage) {
    _dayActivities = appointments;
    scheduleStorage = storage;
  }
  @override
  State<StatefulWidget> createState() {
    return new _ScheduleViewState(_dayActivities, scheduleStorage);
  }
}

class _ScheduleViewState extends State<ScheduleView> {
  List<Activity> _dayActivities;
  LocalStorage scheduleStorage;

  _ScheduleViewState(List<Activity> appointments, LocalStorage storage) {
    _dayActivities = appointments;
    scheduleStorage = storage;
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
                          return AddScheduleEventPopup();
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
        for (var scheduleEvent in _dayActivities)
          Container(
            // margin: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Expanded(
                    child: ScheduleElement(
                        scheduleEvent, _dayActivities, scheduleStorage)),
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
