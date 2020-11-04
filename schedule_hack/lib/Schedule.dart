import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:schedule_hack/DateBanner.dart';
import 'package:intl/intl.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

class Schedule extends StatelessWidget {
  Schedule({Key key, this.title, this.date}) : super(key: key);
  final String title;
  DateTime date;

  //returns String with date formatted e.g. Monday, January 1, 2020
  String getFormattedDate() {
    String dayOfWeek = new DateFormat('EEEE').format(this.date);
    String monthDayYear = new DateFormat.yMMMMd('en_US').format(this.date);
    String fullDate = dayOfWeek + ", " + monthDayYear;
    return fullDate;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios,
          color: colorBlackCoral,
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.settings, color: colorBlackCoral),
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
      bottomNavigationBar: SizedBox(
        height: 58,
        // child: T.TabBar().build(context),
      ),
      body: Container(
        child: ListView(
          children: [DateBanner(date: this.getFormattedDate()), widget()],
        ),
      ),
    );
  }
}

Widget widget() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16.0),
    child: CalendarCarousel(
      onDayPressed: (DateTime date, List<Event> events) {
        // this.setState(() => _currentDate = date);
      },
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
//      weekDays: null, /// for pass null when you do not want to render weekDays
//      headerText: Container( /// Example for rendering custom header
//        child: Text('Custom Header'),
//      ),
      customDayBuilder: (
        /// you can provide your own build function to make custom day containers
        bool isSelectable,
        int index,
        bool isSelectedDay,
        bool isToday,
        bool isPrevMonthDay,
        TextStyle textStyle,
        bool isNextMonthDay,
        bool isThisMonthDay,
        DateTime day,
      ) {
        /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
        /// This way you can build custom containers for specific days only, leaving rest as default.

        // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
        if (day.day == 15) {
          return Center(
            child: Icon(Icons.local_airport),
          );
        } else {
          return null;
        }
      },
      weekFormat: false,
      // markedDatesMap: _markedDateMap,
      height: 420.0,
      // selectedDateTime: _currentDate,
      daysHaveCircularBorder: false,

      /// null for not rendering any border, true for circular border, false for rectangular border
    ),
  );
}
