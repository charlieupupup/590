import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/ActivityDataSource.dart';
import 'package:schedule_hack/AppStorage.dart';
import 'package:schedule_hack/CancelButton.dart';
import 'package:schedule_hack/Home.dart';
import 'package:schedule_hack/utilities.dart';

class ScheduleModify extends StatelessWidget {
  List<Activity> dayActivities;
  Activity activity;
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  ScheduleModify(Activity activity, List<Activity> activities) {
    this.activity = activity;
    dayActivities = activities;
    print(
        "line 23 SM  activity selected is subject: ${this.activity.subject} notes: ${this.activity.notes}");
  }

  @override
  Widget build(BuildContext context) {
    String getDate(DateTime dateTime) {
      final df = new DateFormat('MMM dd, yyyy');
      return df.format(dateTime);
    }

    String getTime(DateTime dateTime) {
      final df = new DateFormat('hh:mm a');
      return df.format(dateTime);
    }

    Widget Start(Activity _activity) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Text('Start:'),
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
                startDateController.text = date
                    .toString()
                    .substring(0, 10); //save to json to send back out
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
                startTimeController.text = time.format(context);
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
            child: Text('End:  '),
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
                endDateController.text = date
                    .toString()
                    .substring(0, 10); //save to json to send back out
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
                endTimeController.text = time.format(context);
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
              ),
              Text(
                "",
                // activity.subject,
                textScaleFactor: 2,
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
                    Text('Details:'),
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
                    ModifyButton(context, activity, notesController,
                        startDateController, endDateController)
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
  TextEditingController notesController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  ModifyButton(
      BuildContext context,
      Activity activity,
      TextEditingController notesController,
      TextEditingController startDateController,
      TextEditingController endDateController) {
    activity = activity;
    context = context;
    notesController = notesController;
    startDateController = startDateController;
    endDateController = endDateController;
  }

  @override
  State<StatefulWidget> createState() {
    return _ModifyButtonState(context, activity, notesController,
        startDateController, endDateController);
  }
}

class _ModifyButtonState extends State<ModifyButton> {
  BuildContext _context;
  Activity _activity;
  TextEditingController _notesController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();

  _ModifyButtonState(
      BuildContext context,
      Activity activity,
      notesController,
      TextEditingController startDateController,
      TextEditingController endDateController) {
    _activity = activity;
    _context = context;
    _notesController = notesController;
    _startDateController = startDateController;
    _endDateController = endDateController;
  }
  _ModifyButtonState createState() => _ModifyButtonState(_context, _activity,
      _startDateController, _endDateController, _notesController);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        setState(() {
          new Activity.fromController(_activity.subject, _startDateController,
              _endDateController, _notesController);
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
