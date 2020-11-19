import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/Home.dart';
import 'package:schedule_hack/ScheduleDay.dart';
import 'package:schedule_hack/ScheduleEvent.dart';
import 'package:schedule_hack/SettingsButton.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// The hove page which hosts the calendar
class ScheduleCalendar extends StatefulWidget {
  int index;

  /// Creates the home page to display teh calendar widget.
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
  List<Activity> meetings;
  ScheduleDay currentDay;
  int _currentIndex = 0;

  _ScheduleCalendarState(int i) {
    this._currentIndex = i;
    this.currentDay = new ScheduleDay.todayFromStorage(storage);
    this.meetings = currentDay.activities;
  }

  List<Activity> getDayFromLocalStorage(LocalStorage s, DateTime date) {
    ScheduleDay day = new ScheduleDay.fromStorage(date, s);
    currentDay = day;
    print(
        "current day is now ${DateFormat.yMEd('en_US').format(currentDay.day)}");
    print("current day activites are ${(currentDay.events.toList())}");

    return day.activities;
  }

  ScheduleDay addActivities(LocalStorage s, DateTime date, List<Activity> a) {
    // ScheduleDay scheduleDay = new ScheduleDay.fromActivities(date, a);
    // scheduleDay.addToLocalStorage(storage);
    ScheduleDay scheduleDay = new ScheduleDay.fromActivities(date, a);
    scheduleDay.addToLocalStorage(s);
    return scheduleDay;
  }

  void removeActivities(LocalStorage s, DateTime date, List<Activity> a) {
    ScheduleDay scheduleDay = new ScheduleDay.fromActivities(date, a);
    scheduleDay.removeFromLocalStorage(s);
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
        onLongPress: (CalendarLongPressDetails details) {
          details.appointments.clear();
          removeActivities(
              storage, details.date, _getDateDataSource(storage, details.date));
          print(
              "REMOVE: ${details.appointments}  on ${DateFormat.yMEd('en_US').format(details.date)}");
        },
        onTap: (CalendarTapDetails details) {
          details.appointments
              .addAll(_getDateDataSource(storage, details.date));
          addActivities(
              storage, details.date, _getDateDataSource(storage, details.date));
          print(
              "ADD: ${details.appointments}  on ${DateFormat.yMEd('en_US').format(details.date)}");
        },
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

  List<Activity> _getPrepopulatedDataSource() {
    final LocalStorage storage = new LocalStorage('calendar.json');
    Activity a = new Activity(DateTime.now(),
        DateTime.now().add(Duration(hours: 2)), "Attend ECE564");
    Activity sleep = new Activity(
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
        DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day, 8),
        "8 hours of sleep");
    Activity sleep2 = new Activity(
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .add(Duration(days: 2)),
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,
                8)
            .add(Duration(days: 2)),
        "8 hours of sleep");
    ScheduleDay scheduleDay =
        addActivities(storage, DateTime.now(), [a, sleep, sleep2]);

    print(scheduleDay.getFromStorage(DateTime.now(), storage));
    return scheduleDay.activities;
  }

  List<Activity> _getDateDataSource(LocalStorage s, DateTime date) {
    List<Activity> local = getDayFromLocalStorage(s, date);
    ScheduleDay scheduleDay = addActivities(s, date, local);
    return scheduleDay.activities;
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class ActivityDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  ActivityDataSource(List<Activity> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].date;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].endDate;
  }

  @override
  String getSubject(int index) {
    return appointments[index].title;
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
