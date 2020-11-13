import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/SettingsButton.dart';
import 'package:schedule_hack/StandardPopup.dart';
import 'package:schedule_hack/utilities.dart';

class CalendarView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarState();
  }
}

class _CalendarState extends State<CalendarView> {
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2020, 11, 1): [
        new Activity(Task.sleep, DateTime(2020, 11, 1), Duration(hours: 8),
            "Sleep", "Get 8 hours of sleep"),
      ],
    },
  );

  CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;

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
    _calendarCarousel = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate = date);
        events.forEach((event) => print(event.title));
      },
      weekendTextStyle: TextStyle(fontSize: 14, color: colorSoftMelon),
      thisMonthDayBorderColor: colorAlmond,

      headerText: "Week of ", //TODO: make method to return first day of week
      weekFormat: true,
      markedDatesMap: _markedDateMap,
      height: 200.0,
      selectedDateTime: _currentDate2,
      showIconBehindDayText: true,
      daysHaveCircularBorder: true,

      /// null for not rendering any border, true for circular border, false for rectangular border
      customGridViewPhysics: NeverScrollableScrollPhysics(),

      todayTextStyle: TextStyle(
        color: colorBlackCoral,
      ),
      selectedDayButtonColor: colorAeroBlue,
      selectedDayBorderColor: colorAeroBlue,
      selectedDayTextStyle: TextStyle(
        color: colorBlackCoral,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      todayButtonColor: colorMelon,
      todayBorderColor: colorAeroBlue,
      markedDateMoreShowTotal:
          false, // null for not showing hidden events indicator
      // markedDateShowIcon: false,
      // markedDateIconMaxShown: 2,
//          markedDateIconMargin: 9,
//          markedDateIconOffset: 3,
    );

    /// Bottom Calendar Carousel without header and with prev & next button
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: colorPowderBlue,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      daysHaveCircularBorder: false,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: colorSoftMelon,
      ),
      thisMonthDayBorderColor: colorAlmond,
      weekFormat: false,
      // firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: 420.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder: Border.all(width: 2.0, color: colorMelon),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 16,
        color: colorMelon,
      ),
      showHeader: false,
      todayTextStyle: TextStyle(
        color: colorBlackCoral,
      ),
      todayButtonColor: colorSoftMelon,
      selectedDayButtonColor: colorAeroBlue,
      selectedDayBorderColor: colorAeroBlue,
      selectedDayTextStyle: TextStyle(
        color: colorBlackCoral,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        color: colorAlmond,
      ),
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
      }, //no idea what this does
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
        ));
  }
}
