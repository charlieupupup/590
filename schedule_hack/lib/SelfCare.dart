import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/CalendarView.dart';
import 'package:schedule_hack/Home.dart';
import 'package:schedule_hack/NewCoursePopup.dart';
import 'package:schedule_hack/Notify.dart';
import 'package:schedule_hack/SettingsButton.dart';
import 'package:schedule_hack/StandardPopup.dart';
import 'package:schedule_hack/utilities.dart';

class SelfCare extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SelfCareState();
  }
}

class SelfCareState extends State<SelfCare> {
  List<Event> events = new List<Event>();
  // CalendarView cal = CalendarView.shared;

  @override
  void initState() {
    /// Add more events to _markedDateMap EventList
    events = new List<Event>();
    Event e1 = new Activity(
        DateTime.now().toIso8601String(), 1, "ECE564", "Attend ECE564");
    Event e2 = Activity.assignment(
        DateTime.now(), Duration(hours: 2), "ECE590", "Final Project");
    Event e3 = new Activity.assignment(
        DateTime.now(), Duration(hours: 3), "MENG570", "Final Exam");
    events.add(e1);
    events.add(e2);
    events.add(e3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: colorBlackCoral,
              ),
              onPressed: () {
                // Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(0),
                  ),
                );
              }),
          // Icon(
          //   Icons.arrow_back_ios,
          //   color: colorBlackCoral,
          // ),
          actions: [
            Row(
              children: [
                SettingsButton(),
                IconButton(
                  icon: Icon(
                    Icons.alarm,
                    color: colorBlackCoral,
                  ),
                  onPressed: () {
                    Notify n = Notify();
                    n.ini(context);
                    n.notify();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Home(0)),
                    // );
                    // showDialog(context: context, child: MidPopUp());
                  },
                )
              ],
            ),
          ],
          title: Text('Self Care',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: colorBlackCoral)),
          backgroundColor: colorHoneydew,
        ),
        body: Container(
          child: ListView(
            children: [
              SizedBox(
                width: 300,
                height: 150,
                child: Card(
                  margin: EdgeInsets.all(6.0),
                  elevation: 4.0,
                  color: colorMelon,
                  child: Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      "This is the self care banner",
                      style: TextStyle(fontSize: 24, color: colorIvory),
                      maxLines: 1,
                      minFontSize: 20,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 180.0,
                    height: 300.0,
                    color: Colors.transparent,
                    margin: EdgeInsets.all(6.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: colorAeroBlue,
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: colorAeroBlue,
                          onPressed: () {
                            // cal.getActivities(DateTime.now());
                            String message =
                                'Showing recommendations for things to do to center yourself';
                            //_showMaterialDialog2(message);
                            StandardPopup(context, message, 2);
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(left: 10, top: 50, right: 10),
                            child: ListView(children: [
                              new Text("Check-In",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20.0, color: colorBlackCoral)),
                              ImageIcon(
                                AssetImage("images/relax.png"),
                                color: colorBlackCoral,
                                size: 75.0,
                              ),
                              new Text(
                                  "Click for methods to recenter yourself and tune into your mental health",
                                  //textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0, color: colorBlackCoral)),
                            ]),
                          )),
                    ),
                  ),
                  Container(
                    width: 180.0,
                    height: 300.0,
                    color: Colors.transparent,
                    margin: EdgeInsets.all(6.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: colorPowderBlue,
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: colorPowderBlue,
                          onPressed: () {
                            // cal.addActivities(DateTime.now(), events);
                            String message =
                                'Showing recommendations for things to do to escape';
                            //_showMaterialDialog2(message);
                            StandardPopup(context, message, 2);
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(left: 10, top: 50, right: 10),
                            child: ListView(children: [
                              new Text("Check-Out",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20.0, color: colorBlackCoral)),
                              ImageIcon(
                                AssetImage("images/checkout.png"),
                                color: colorBlackCoral,
                                size: 75.0,
                              ),
                              new Text(
                                  "Click for methods to decompress and relax",
                                  //textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0, color: colorBlackCoral)),
                            ]),
                          )),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
