import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/ActivityDataSource.dart';
import 'package:schedule_hack/AppStorage.dart';
import 'package:schedule_hack/Home.dart';
import 'package:schedule_hack/Activities.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/SettingsButton.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  int index; //TODO: I'm not using these correctly -- bottom nav doesn't work
  /// Creates the home page to display the calendar widget.
  Calendar() {
  }

  @override
  _CalendarState createState() {
    return _CalendarState();
  }
}

class _CalendarState extends State<Calendar> with AppStorage {
  final LocalStorage calendarStorage = new LocalStorage('calendar.json');
  Activities activities;
  int _currentIndex = 0;

  _CalendarState() {
    this.activities = new Activities.todayFromStorage(calendarStorage);
  }

  @override
  Widget build(BuildContext context) {
    // var padding = MediaQuery.of(context).padding;
    // double width =
    //     MediaQuery.of(context).size.width - padding.left - padding.right;
    // double height =
    //     MediaQuery.of(context).size.height - padding.top - padding.bottom;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: colorBlackCoral,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.assignment,
                  color: colorBlackCoral,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home(0)),
                  );
                  // showDialog(context: context, child: MidPopUp());
                },
              ),
              SettingsButton()
            ],
          ),
        ],
        title: Text('Calendar View',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: colorBlackCoral)),
        backgroundColor: colorHoneydew,
      ),
      body: SfCalendar(
        view: CalendarView.month,
        viewHeaderStyle: ViewHeaderStyle(
            backgroundColor: colorPewterBlue,
            dayTextStyle: TextStyle(color: colorIvory, fontSize: 20),
            dateTextStyle: TextStyle(color: colorBlackCoral, fontSize: 25)),
        cellBorderColor: colorDarkSkyBlue,
        todayHighlightColor: colorAeroBlue,
        selectionDecoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: colorSoftMelon, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          shape: BoxShape.rectangle,
        ),
        todayTextStyle: TextStyle(
            fontSize: 22, color: colorBlackCoral, fontWeight: FontWeight.bold),
        backgroundColor: colorBeige,
        onLongPress: (CalendarLongPressDetails details) {},
        onTap: (CalendarTapDetails details) {},
        dataSource: ActivityDataSource(_getPrepopulatedDataSource()),
        // by default the month appointment display mode set as Indicator, we can
        // change the display mode as appointment using the appointment display
        // mode property
        monthViewSettings: MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
      ),
    );
  }


  //random data in calendar
  Activities _getPrepopulatedDataSource() {
    Activity a0 = new Activity.test("Study", 0);
    Activity a1 = new Activity.test("Attend Class", 2);
    Activity a2 = new Activity.test("Sleep", 4);
    Activities a = new Activities.fromActivities(DateTime.now(), [a0, a1, a2]);
    this.activities = a;
    return a;
  }
}