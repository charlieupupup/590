import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/ScheduleEvent.dart';
import 'package:schedule_hack/SettingsButton.dart';
import 'package:schedule_hack/utilities.dart';

// enum Tab { schedule, selfCare, courses }
//
// class CalendarView extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _CalendarState();
//   }
// }
//
// class _CalendarState extends State<CalendarView> {
//   DateTime _currentDateWeekView = DateTime.now();
//   DateTime _currentDateMonthView = DateTime.now();
//   String _currentMonth = DateFormat.yMMM().format(DateTime.now());
//   String _firstDayOfCurrentWeek =
//       DateFormat.yMMMd('en_US').format(DateTime.now());
//   DateTime _targetDateTime = DateTime.now();
//   EventList<Event> _markedDateMap = new EventList<Event>();
//   final LocalStorage storage = new LocalStorage('activity.json');
//
//   CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;
//
//
//
class CalendarViewOld extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarStateOld();
  }
}

class _CalendarStateOld extends State<CalendarViewOld> {
  DateTime _currentDateMonthView = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();
  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2020, 11, 1): [
        new Activity.fromIso8601(
            DateTime(2020, 11, 1, 5).toIso8601String(),
            DateTime(2020, 11, 1, 7).toIso8601String(),
            "ECE564",
            "Final Presentation Prep"),
        new Activity.fromIso8601(
            DateTime(2020, 11, 1, 9).toIso8601String(),
            DateTime(2020, 11, 1, 11).toIso8601String(),
            "ECE590",
            "Finish Prototype"),
        new Activity.fromIso8601(
            DateTime(2020, 11, 1, 14).toIso8601String(),
            DateTime(2020, 11, 1, 19).toIso8601String(),
            "ECE564",
            "Final Presentation")
      ],
    },
  );

  CalendarCarousel _calendarCarouselNoHeader;

  @override
  void initState() {
    _markedDateMap.addAll(new DateTime(2020, 11, 7), [
      new Activity.fromIso8601(
          DateTime(2020, 11, 7, 5).toIso8601String(),
          DateTime(2020, 11, 7, 7).toIso8601String(),
          "ECE564",
          "Final Presentation Prep"),
      new Activity.fromIso8601(
          DateTime(2020, 11, 7, 9).toIso8601String(),
          DateTime(2020, 11, 7, 11).toIso8601String(),
          "ECE590",
          "Finish Prototype"),
      new Activity.fromIso8601(
          DateTime(2020, 11, 7, 14).toIso8601String(),
          DateTime(2020, 11, 7, 19).toIso8601String(),
          "ECE564",
          "Final Presentation")
    ]);
    print("in initState ${_markedDateMap.events.entries}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController myController = TextEditingController();
    var padding = MediaQuery.of(context).padding;
    // double width = MediaQuery.of(context).size.width - padding.left - padding.right;
    double height =
        MediaQuery.of(context).size.height - padding.top - padding.bottom;

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
      height: height * (2 / 3),
      showHeader: false,
      weekFormat: false,
      // firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      selectedDateTime: _currentDateMonthView,
      targetDateTime: _targetDateTime,
      minSelectedDate: _currentDateMonthView.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDateMonthView.add(Duration(days: 360)),
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
          fontSize: 16, color: colorPewterBlue, fontWeight: FontWeight.bold),
      //Sun Mon Tue
      weekendTextStyle: TextStyle(fontSize: 16, color: colorBlackCoral),
      daysTextStyle: TextStyle(fontSize: 16, color: colorBlackCoral),
      //14 15 16
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
            // This trailing comma makes auto-formatting nicer for build methods.
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
            ),
            //
          ],
        ),
      ),
    );
  }
}
// class _MyHomePageState extends State<HomePage> {
//   final List<Activity> activities = new List<Activity>();
//   final ScheduleList list = new ScheduleList();
//   final LocalStorage storage = new LocalStorage('activity.json');
//   bool initialized = false;
//   TextEditingController controller = new TextEditingController();
//
//
//   _addItem(String description) {
//     setState(() {
//       final item = new ScheduleItem(
//           title: "TEST",
//           date: DateTime.now().toIso8601String(),
//           duration: 2,
//           description: description,
//           done: false);
//       list.items.add(item);
//       _saveToStorage();
//     });
//   }
//
//   _saveToStorage() {
//     storage.setItem('items', list.toJSONEncodable());
//   }
//
//   _clearStorage() async {
//     await storage.clear();
//
//     setState(() {
//       list.items = storage.getItem('items') ?? [];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('Localstorage demo'),
//       ),
//       body: Container(
//           padding: EdgeInsets.all(10.0),
//           constraints: BoxConstraints.expand(),
//           child: FutureBuilder(
//             future: storage.ready,
//             builder: (BuildContext context, AsyncSnapshot snapshot) {
//               if (snapshot.data == null) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               if (!initialized) {
//                 var items = storage.getItem('items');
//                 if (items != null) {
//                   list.items = List<ScheduleItem>.from(
//                     (items as List).map(
//                       (item) => ScheduleItem(
//                         title: item['title'],
//                         done: item['done'],
//                         description: item['description'],
//                         duration: item['duration'],
//                         date: item['date'],
//                       ),
//                     ),
//                   );
//                 }
//                 initialized = true;
//               }
//
//               List<Widget> widgets = list.items.map((item) {
//                 return CheckboxListTile(
//                   value: item.done,
//                   title: Text(item.title),
//                   selected: item.done,
//                   onChanged: (bool selected) {
//                     _toggleItem(item);
//                   },
//                 );
//               }).toList();
//
//               return Column(
//                 children: <Widget>[
//                   Expanded(
//                     flex: 1,
//                     child: ListView(
//                       children: widgets,
//                       itemExtent: 50.0,
//                     ),
//                   ),
//                   ListTile(
//                     title: TextField(
//                       controller: controller,
//                       decoration: InputDecoration(
//                         labelText: 'Description',
//                       ),
//                       onEditingComplete: _save,
//                     ),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         IconButton(
//                           icon: Icon(Icons.save),
//                           onPressed: _save,
//                           tooltip: 'Save',
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.delete),
//                           onPressed: _clearStorage,
//                           tooltip: 'Clear storage',
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.arrow_upward),
//                           onPressed: _print,
//                           tooltip: 'Print events',
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             },
//           )),
//     );
//   }
//
//   void _save() {
//     _addItem(controller.value.text);
//     controller.clear();
//   }
//
//   void _print() {
//     var items = storage.getItem('items');
//     if (items != null) {
//       List<ScheduleItem> list =
//           List<ScheduleItem>.from((items as List).map((item) => ScheduleItem(
//                 title: item['title'],
//                 done: item['done'],
//                 description: item['description'],
//                 duration: item['duration'],
//                 date: item['date'],
//               )));
//       List<Activity> events = getActivityList(list);
//       for (int i = 0; i < events.length; i++) {
//         String e = events[i].description;
//         print("event $e");
//       }
//     }
//   }
// }
