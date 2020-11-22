import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activity.dart';
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
    var padding = MediaQuery.of(context).padding;
    double height =
        MediaQuery.of(context).size.height - padding.top - padding.bottom;
    double width =
        MediaQuery.of(context).size.width - padding.left - padding.right;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: width * 0.80,
            height: 120,
            child: Card(
              margin: EdgeInsets.only(top: 30.0),
              elevation: 5.0,
              color: colorPowderBlue,
              // borderRadius: BorderRadius.circular(22.0),
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
            )),
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
            width: width * 0.80,
            height: (height / 3) / _dayActivities.length,
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
