import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/NewCoursePopup.dart';
import 'package:schedule_hack/SettingsButton.dart';
import 'package:schedule_hack/StandardPopup.dart';
import 'package:schedule_hack/utilities.dart';

enum Tab { schedule, selfCare, courses }
//
// class CalendarSingleton extends CalendarView {
//   static CalendarSingleton _instance;
//   CalendarSingleton._internal();
//
//   factory CalendarSingleton() {
//     if (_instance == null) {
//       _instance = CalendarSingleton._internal();
//     }
//     return _instance;
//   }
// }

class CalendarView extends StatefulWidget {
  EventList<Event> markedDateMap;
  int _currentIndex = 0;
  static CalendarView _instance;
  DateTime date = DateTime.now();
  CalendarView._internal();

  factory CalendarView() {
    if (_instance == null) {
      _instance = CalendarView._internal();
    }
    return _instance;
  }
  @override
  State<StatefulWidget> createState() {
    this.markedDateMap = new EventList<Event>(
      events: {
        date: [
          new Activity(Task.sleep, date, Duration(hours: 8), "Sleep",
              "Get 8 hours of sleep"),
        ],
      },
    );
    return _CalendarState(date, markedDateMap);
  }

  void addActivities(DateTime date, List<Activity> activities) {
    this.markedDateMap.addAll(date, activities);
    print("added $activities");
  }
}

class _CalendarState extends State<CalendarView> {
  int _currentIndex = 0;
  DateTime _currentDateWeekView;
  DateTime _currentDateMonthView;
  String _currentMonth;
  String _firstDayOfCurrentWeek;
  DateTime _targetDateTime;
  EventList<Event> _markedDateMap;

  CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;

  _CalendarState(DateTime date, EventList<Event> events) {
    _currentDateWeekView = date;
    _currentDateMonthView = date;
    _currentMonth = DateFormat.yMMM().format(date);
    _firstDayOfCurrentWeek = DateFormat.yMMMd('en_US').format(date);
    _targetDateTime = date;
    _markedDateMap = events;
    // _markedDateMap = new EventList<Event>(
    //   events: {
    //     date: [
    //       new Activity(Task.sleep, date, Duration(hours: 8),
    //           "Sleep", "Get 8 hours of sleep"),
    //     ],
    //   },
    // );
  }

  @override
  void initState() {
    /// Add more events to _markedDateMap EventList
    _markedDateMap.add(
        new DateTime(2020, 11, 2),
        new Activity(Task.takeBreak, DateTime(2020, 11, 2), Duration(hours: 2),
            "Break", "Take a stretch Break"));
    _markedDateMap.add(
        new DateTime(2020, 11, 3),
        new Activity.assignment(DateTime(2020, 11, 3, 10), Duration(hours: 5),
            "ECE590", "Final Project"));
    _markedDateMap.addAll(new DateTime(2020, 11, 4), [
      new Activity(Task.attendClass, DateTime(2020, 11, 4, 2),
          Duration(hours: 1), "ECE564", "Attend ECE564"),
      new Activity.assignment(DateTime(2020, 11, 4, 4), Duration(hours: 2),
          "ECE590", "Final Project"),
      new Activity.assignment(
          DateTime(2020, 11, 4, 9), Duration(hours: 3), "MENG570", "Final Exam")
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController myController = TextEditingController();
    var padding = MediaQuery.of(context).padding;
    // double width = MediaQuery.of(context).size.width - padding.left - padding.right;
    double height =
        MediaQuery.of(context).size.height - padding.top - padding.bottom;

    _calendarCarousel = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDateWeekView = date);
        events.forEach((event) => print(event.title));
      },
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _currentDateWeekView = date;
          _targetDateTime =
              CalendarDateTime.firstDayOfWeek(_currentDateWeekView);
          _firstDayOfCurrentWeek =
              DateFormat.yMMMd('en_US').format(_targetDateTime);
        }); //changes the _firstDayOfCurrentWeek when top is changed (for the header)
      },
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      height: height * (9 / 32),
      weekFormat: true,
      minSelectedDate: _currentDateWeekView.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDateWeekView.add(Duration(days: 360)),
      markedDatesMap: _markedDateMap,
      selectedDateTime: _currentDateMonthView,
      showIconBehindDayText: true,
      daysHaveCircularBorder: true,
      iconColor: colorDarkSkyBlue,
      thisMonthDayBorderColor: colorAlmond,
      headerText: "Week of $_firstDayOfCurrentWeek",
      headerTextStyle: TextStyle(
          fontSize: 22, color: colorBlackCoral, fontWeight: FontWeight.bold),
      markedDateCustomShapeBorder:
          CircleBorder(side: BorderSide(color: colorMelon)),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 16,
        color: colorMelon,
      ),
      weekdayTextStyle: TextStyle(
          fontSize: 16,
          color: colorPewterBlue,
          fontWeight: FontWeight.bold), //Sun Mon Tue
      weekendTextStyle: TextStyle(fontSize: 16, color: colorBlackCoral),
      daysTextStyle: TextStyle(fontSize: 16, color: colorBlackCoral), //14 15 16
      todayButtonColor: Colors.transparent,
      todayBorderColor: colorMelon,
      todayTextStyle: TextStyle(
          fontSize: 22, color: colorMelon, fontWeight: FontWeight.bold),

      /// null for not rendering any border, true for circular border, false for rectangular border
      selectedDayButtonColor: colorAeroBlue,
      selectedDayBorderColor: colorDarkSkyBlue,
      selectedDayTextStyle: TextStyle(
          fontSize: 22, color: colorBlackCoral, fontWeight: FontWeight.bold),
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
        showDialog(
            context: context,
            builder: (_) {
              return NewCoursePopup(myController);
            });
      },
    );

    /// Bottom Calendar Carousel without header and with prev & next button
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDateMonthView = date);
        events.forEach((event) => print(event.title));
      },
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      daysHaveCircularBorder: false,
      showOnlyCurrentMonthDate: false,
      thisMonthDayBorderColor: colorAlmond,
      height: height * (9 / 16),
      showHeader: false,
      weekFormat: false,
      // firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      selectedDateTime: _currentDateMonthView,
      targetDateTime: _targetDateTime,
      minSelectedDate: _currentDateWeekView.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDateWeekView.add(Duration(days: 360)),
      markedDateCustomShapeBorder: Border.all(width: 1.0, color: colorMelon),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 16,
        color: colorMelon,
      ),
      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        color: colorAlmond,
      ),
      weekdayTextStyle: TextStyle(
          fontSize: 16,
          color: colorPewterBlue,
          fontWeight: FontWeight.bold), //Sun Mon Tue
      weekendTextStyle: TextStyle(fontSize: 16, color: colorBlackCoral),
      daysTextStyle: TextStyle(fontSize: 16, color: colorBlackCoral), //14 15 16
      todayButtonColor: Colors.transparent,
      todayBorderColor: colorMelon,
      todayTextStyle: TextStyle(
          fontSize: 22, color: colorMelon, fontWeight: FontWeight.bold),

      /// null for not rendering any border, true for circular border, false for rectangular border
      selectedDayButtonColor: colorAeroBlue,
      selectedDayBorderColor: colorDarkSkyBlue,
      selectedDayTextStyle: TextStyle(
          fontSize: 22, color: colorBlackCoral, fontWeight: FontWeight.bold),
      inactiveDaysTextStyle: TextStyle(
        color: colorPowderBlue,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
        showDialog(
            context: context,
            builder: (_) {
              return NewCoursePopup(myController);
            });
      },
    );

    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios,
          color: colorBlackCoral,
        ),
        actions: [
          Row(
            children: [
              //Icon(Icons.settings, color: colorBlackCoral),
              SettingsButton(),
            ],
          ),
        ],
        title: Text('ScheduleHack',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: colorBlackCoral)),
        backgroundColor: colorHoneydew,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //custom icon
            Container(
              margin: EdgeInsets.only(
                top: 0.0,
                bottom: 0.0,
                left: 16.0,
                right: 16.0,
              ),
              child: _calendarCarousel,
            ), // This trailing comma makes auto-formatting nicer for build methods.
            //custom icon without header
            Container(
              margin: EdgeInsets.only(
                top: 0.0,
                bottom: 0.0,
                left: 16.0,
                right: 16.0,
              ),
              child: new Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    _currentMonth,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  )),
                  FlatButton(
                    child: Text('PREV'),
                    onPressed: () {
                      setState(() {
                        _targetDateTime = DateTime(
                            _targetDateTime.year, _targetDateTime.month - 1);
                        _currentMonth =
                            DateFormat.yMMM().format(_targetDateTime);
                      });
                    },
                  ),
                  FlatButton(
                    child: Text('NEXT'),
                    onPressed: () {
                      setState(() {
                        _targetDateTime = DateTime(
                            _targetDateTime.year, _targetDateTime.month + 1);
                        _currentMonth =
                            DateFormat.yMMM().format(_targetDateTime);
                      });
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 0.0,
                bottom: 0.0,
                left: 16.0,
                right: 16.0,
              ),
              child: _calendarCarouselNoHeader,
            ), //
          ],
        ),
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
}
