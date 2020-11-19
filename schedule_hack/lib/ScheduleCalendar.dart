import 'package:flutter/material.dart';
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

  List<Activity> getDayFromLocalStorage(DateTime date) {
    ScheduleDay day = new ScheduleDay.fromStorage(date, storage);
    print(day.activities.asMap());
    currentDay = day;
    return day.activities;
  }

  void addActivities(List<Activity> activities) {
    for (int i = 0; i < activities.length; i++) {
      activities[i].addToLocalStorage(storage);
    }
  }

  void removeActivities(List<Activity> activities) {
    for (int i = 0; i < activities.length; i++) {
      activities[i].removeFromLocalStorage(storage);
    }
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
          getDayFromLocalStorage(details.date);
        },
        onTap: (CalendarTapDetails details) {
          addActivities(_getDataSource());
          print("tap");
        },
        dataSource: ActivityDataSource(_getDataSource()),
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

  List<Activity> _getDataSource() {
    meetings.add(new Activity.fromActivityOld(new ActivityOld.fromIso8601(
        DateTime(2020, 11, 4, 1).toIso8601String(),
        DateTime(2020, 11, 4, 3).toIso8601String(),
        "ECE564",
        "Attend ECE564")));
    meetings.add(Activity.fromActivityOld((new ActivityOld.fromIso8601(
        DateTime(2020, 11, 7, 1).toIso8601String(),
        DateTime(2020, 11, 7, 3).toIso8601String(),
        "ECE590",
        "Attend ECE564"))));
    return meetings;
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class ActivityDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  ActivityDataSource(List<Activity> source) {
    appointments = ScheduleDay.fromActivities(source).activities;
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
