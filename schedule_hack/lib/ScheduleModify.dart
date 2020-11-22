import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activities.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/ActivityDataSource.dart';
import 'package:schedule_hack/AppStorage.dart';
import 'package:schedule_hack/CancelButton.dart';
import 'package:schedule_hack/Home.dart';
import 'package:schedule_hack/utilities.dart';

class ScheduleModify extends StatelessWidget {
  Activities dayActivities;
  Activity activity;
  LocalStorage scheduleStorage;
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  String startTime;
  String endTime;
  String startDate;
  String endDate;
  String notes;

  ScheduleModify(
      Activity _activity, List<Activity> activities, LocalStorage storage) {
    this.activity = _activity;
    this.dayActivities =
        new Activities.fromActivities(_activity.startTime, activities);
    this.scheduleStorage = storage;
    startDateController.text = getDate(activity.startTime);
    endDateController.text = getDate(activity.endTime);
    startTimeController.text = getTime(activity.startTime);
    endTimeController.text = getTime(activity.endTime);
    notesController.text = activity.notes;
    notes = activity.notes;
    endDate = getDate(activity.endTime);
    endTime = getTime(activity.endTime);
    startDate = getDate(activity.startTime);
    startTime = getTime(activity.startTime);
  }
  String getDate(DateTime dateTime) {
    final df = new DateFormat('yyyy-MM-dd');
    return df.format(dateTime);
  }

  String getTime(DateTime dateTime) {
    final df = new DateFormat('hh:mm a');
    return df.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    Widget Start(Activity _activity) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Text('Start:',
                style: TextStyle(
                    color: colorBlackCoral,
                    fontWeight: FontWeight.bold)),
          ),

          Expanded(
            child: TextField(
              readOnly: true,
              controller: startDateController,
              decoration: InputDecoration(
                hintText: getDate(_activity.startTime),
                filled: true,
                fillColor: colorBeige,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorBlackCoral),
                ),
              ),
              onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.from(colorScheme: setDateColors()),
                      child: child,
                    );
                  },
                );
                if (date != null){
                  startDateController.text = date
                      .toString()
                      .substring(0, 10); //save to json to send back out
                  startDate = startDateController.text;
                }
              },
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          //),
          Expanded(
            child: TextField(
              readOnly: true,
              controller: startTimeController,
              decoration: InputDecoration(
                  hintText: getTime(_activity.startTime),
                  filled: true,
                  fillColor: colorBeige,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorBlackCoral),
                  ),
                  suffixIcon: Icon(Icons.access_alarm)),
              onTap: () async {
                var time = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.from(colorScheme: setTimeColors()),
                      child: child,
                    );
                  },
                );
                if (time != null) {
                  startTimeController.text = time.format(context);
                  startTime = startTimeController.text;
                }
              },
            ),
          ),
        ],
      );
    }

    Widget End(Activity _activity) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text('End:  ',
                style: TextStyle(
                    color: colorBlackCoral,
                    fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: TextField(
              readOnly: true,
              controller: endDateController,
              decoration: InputDecoration(
                hintText: getDate(_activity.endTime),
                filled: true,
                fillColor: colorBeige,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorBlackCoral),
                ),
              ),
              onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.from(colorScheme: setDateColors()),
                      child: child,
                    );
                  },
                );
                if (date != null){
                  endDateController.text = date
                      .toString()
                      .substring(0, 10); //save to json to send back out
                  endDate = endDateController.text;
                }
              },
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: TextField(
              readOnly: true,
              controller: endTimeController,
              decoration: InputDecoration(
                  hintText: getTime(_activity.endTime),
                  filled: true,
                  fillColor: colorBeige,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorBlackCoral),
                  ),
                  suffixIcon: Icon(Icons.access_alarm)),
              onTap: () async {
                var time = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.from(colorScheme: setTimeColors()),
                      child: child,
                    );
                  },
                );
                if (time != null) {
                  endTimeController.text = time.format(context);
                  endTime = endTimeController.text;
                }
              },
            ),
          ),
        ],
      );
    }

    return SimpleDialog(
      backgroundColor: colorPowderBlue,
      elevation: 16,
      children: [
        Container(
          //margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Text(
                'Modify Task',
                textScaleFactor: 1,
                  style: TextStyle(
                      color: colorBlackCoral,
                      fontWeight: FontWeight.bold),
              ),
              Text(
                activity.subject,
                textScaleFactor: 2,
                  style: TextStyle(
                      color: colorBlackCoral,
                      fontWeight: FontWeight.bold),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          width: 400,
          height: 75,
          decoration: BoxDecoration(
            color: colorPowderBlue,
            // borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        //SingleChildScrollView(
        //child: Container(
        Container(
          color: colorAeroBlue,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                Start(activity),
                SizedBox(height: 10),
                End(activity),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Details:',
                        style: TextStyle(
                            color: colorBlackCoral,
                            fontWeight: FontWeight.bold)),
                    Text(''),
                    Text(''),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: 300,
                  height: 100,
                  //decoration: BoxDecoration(border: Border.all(color: colorBlackCoral)),
                  child: TextField(
                    controller: notesController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: colorBeige,
                      border: OutlineInputBorder(),
                      labelText: activity.notes,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CancelButton(),
                    ModifyButton(activity, dayActivities, context, endDate,
                        endTime, notes, scheduleStorage, startDate, startTime),
                  ],
                ),
              ],
            ),
          ),
        )

        //),
      ],
      // title: Text(_activity.title),
    );
  }
}

class ModifyButton extends StatefulWidget with AppStorage {
  BuildContext context;
  Activity activity;
  Activities activities;
  LocalStorage scheduleStorage;
  // TextEditingController notesController = TextEditingController();
  // TextEditingController startDateController = TextEditingController();
  // TextEditingController endDateController = TextEditingController();
  // TextEditingController startTimeController = TextEditingController();
  // TextEditingController endTimeController = TextEditingController();
  String startTime;
  String endTime;
  String startDate;
  String endDate;
  String notes;

  ModifyButton(
      Activity _activity,
      Activities _activities,
      BuildContext _context,
      String _endDate,
      String _endTime,
      String _notes,
      LocalStorage storage,
      String _startDate,
      String _startTime) {
    this.activity = _activity;
    this.context = _context;
    this.activities = _activities;
    this.notes = _notes;
    this.startDate = _startDate;
    this.endDate = _endDate;
    this.startTime = _startTime;
    this.endTime = _endTime;
    this.scheduleStorage = storage;
  }

  @override
  State<StatefulWidget> createState() {
    return _ModifyButtonState(activity, activities, context, endDate, endTime,
        notes, scheduleStorage, startDate, startTime);
  }
}

class _ModifyButtonState extends State<ModifyButton> {
  BuildContext _context;
  Activity _activity;
  Activities _activities;
  LocalStorage _scheduleStorage;
  String _notesController;
  String _startDateController;
  String _endDateController;
  String _startTimeController;
  String _endTimeController;

  _ModifyButtonState(
      Activity activity,
      Activities activities,
      BuildContext context,
      String endDateController,
      String endTimeController,
      String notesController,
      LocalStorage scheduleStorage,
      String startDateController,
      String startTimeController) {
    _activity = activity;
    _activities = activities;
    _context = context;
    _notesController = notesController;
    _startDateController = startDateController;
    _endDateController = endDateController;
    _startTimeController = startTimeController;
    _endTimeController = endTimeController;
    _scheduleStorage = scheduleStorage;
  }
  _ModifyButtonState createState() => _ModifyButtonState(
      _activity,
      _activities,
      _context,
      _endDateController,
      _endTimeController,
      _notesController,
      _scheduleStorage,
      _startDateController,
      _startTimeController);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        setState(() {
          TimeOfDay startTimeOfDay =
              TimeOfDayConverter.fromString(_startTimeController);
          TimeOfDay endTimeOfDay =
              TimeOfDayConverter.fromString(_endTimeController);
//add Time of Day to DateTime to get full DateTime
          DateTime startTime = DateTime.parse(_startDateController).add(
              Duration(
                  hours: startTimeOfDay.hour, minutes: startTimeOfDay.minute));
          DateTime endTime = DateTime.parse(_endDateController).add(
              Duration(hours: endTimeOfDay.hour, minutes: endTimeOfDay.minute));
          Activity newActivity = new Activity(startTime.toIso8601String(),
              endTime.toIso8601String(), _activity.subject, _notesController);
          //
          // print("activities before ${_activities.activities}");
          // print(
          //     "local storage before ${Activities.getActivitiesFromStorage(_activity.startTime, _scheduleStorage)}");
          _activities.removeActivityFromLocalStorage(
              _activity, _scheduleStorage);
          // print("activity is now ${_activities.activities}");
          // print(
          //     "local storage after ${Activities.getActivitiesFromStorage(_activity.startTime, _scheduleStorage)}");
          _activities.activities.add(newActivity);
          // print("activity after add  ${_activities.activities}");
          // print(
          //     "local storage after add ${Activities.getActivitiesFromStorage(_activity.startTime, _scheduleStorage)}");
          _activities.addToLocalStorage(_activity.startTime, _scheduleStorage);
          // print("activity after add  to storage ${_activities.activities}");
          // print(
          //     "local storage after add to storage ${Activities.getActivitiesFromStorage(_activity.startTime, _scheduleStorage)}");
          print("new activity");
          Activities a = new Activities.fromStorage(
              newActivity.startTime, _scheduleStorage);
          a.printActivities();
          a.removeActivityFromLocalStorage(newActivity, _scheduleStorage);
          a.printActivities();
          a.activities.add(_activity);
          a.printActivities();
          a.addToLocalStorage(newActivity.startTime, _scheduleStorage);
          a.printActivities();
        });
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Home(0)),
          (route) => false,
        );
      },
      color: colorHoneydew,
      child: Image.asset(
        'images/checkmark.png',
        height: 50,
        width: 50,
      ),
      shape: CircleBorder(),
    );
  }
}
