import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/Home.dart';
import 'package:schedule_hack/Activities.dart';
import 'package:schedule_hack/ScheduleEvent.dart';
import 'package:schedule_hack/SettingsButton.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ScheduleCalendar extends StatefulWidget {
  int index; //TODO: I'm not using these correctly -- bottom nav doesn't work

  /// Creates the home page to display the calendar widget.
  ScheduleCalendar(int i) {
    this.index = i;
  }

  @override
  _ScheduleCalendarState createState() {
    return _ScheduleCalendarState(this.index);
  }
}

class _ScheduleCalendarState extends State<ScheduleCalendar> {
  final LocalStorage storage = new LocalStorage('calendar.json');
  Activities activities;
  int _currentIndex = 0;

  _ScheduleCalendarState(int i) {
    this._currentIndex = i;
    this.activities = new Activities.todayFromStorage(storage);
  }

  //Gets the list activites from storage  for a particular date
  Activities getActivitiesFromDate(LocalStorage s, DateTime date) {
    Activities day = new Activities.fromStorage(date, s);
    activities = day;
    print(
        "current day is now ${DateFormat.yMEd('en_US').format(activities.day)}");
    print("current day activites are ${(activities.events.toList())}");

    return day;
  }

  //Adds Activities to local calendar and returns that list of activities
  Activities addActivities(LocalStorage s, DateTime date, Activities a) {
    a.addToLocalStorage(s);
    return a;
  }

  //removes all Activites from date
  void removeActivities(LocalStorage s, DateTime date, Activities a) {
    a.removeAllFromLocalStorage(s);
  }

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    double width =
        MediaQuery.of(context).size.width - padding.left - padding.right;
    double height =
        MediaQuery.of(context).size.height - padding.top - padding.bottom;
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorHoneydew,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/schedule.png"),
              color: colorBlackCoral,
            ),
            label: 'Schedule',
          ),
          new BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/self_care.png"),
              color: colorBlackCoral,
            ),
            label: 'Self-Care',
          ),
          new BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/classroom.png"),
                color: colorBlackCoral,
              ),
              label: 'Courses')
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Activities _getPrepopulatedDataSource() {
    final LocalStorage storage = new LocalStorage('calendar.json');
    ActivityNew course = new ActivityNew(DateTime.now(),
        DateTime.now().add(Duration(hours: 2)), "Attend ECE564");
    ActivityNew sleep = new ActivityNew(
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
        DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day, 8),
        "8 hours of sleep");
    ActivityNew sleep2 = new ActivityNew(
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .add(Duration(days: 2)),
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,
                8)
            .add(Duration(days: 2)),
        "8 hours of sleep");
    Activities a = new Activities.fromActivityList(
        DateTime.now(), [course, sleep, sleep2]);
    this.activities = addActivities(storage, DateTime.now(), a);
    print(activities.getFromStorage(DateTime.now(), storage));
    return activities;
  }
}
//get Data for particular date -- currently not using
//   Activities _getDateDataSource(LocalStorage s, DateTime date) {
//     Activities local = getActivitiesFromDate(s, date);
//     Activities activities = addActivities(s, date, local);
//     return activities;
//   }
// }

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class ActivityDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  ActivityDataSource(Activities source) {
    appointments = source.activities;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].endTime;
  }

  @override
  String getSubject(int index) {
    return appointments[index].subject;
  }

  @override
  Color getColor(int index) {
    return colorMelon;
  }

//   /// isAllDay which is equivalent to isAllDay property of [Appointment].
  @override
  bool isAllDay(int index) {
    return false;
  }
}
