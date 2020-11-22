import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activities.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/ActivityDataSource.dart';
import 'package:schedule_hack/Home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule_hack/Notify.dart';
import 'package:schedule_hack/PopUp.dart';
import 'package:schedule_hack/WelcomeScreen.dart';
import 'package:schedule_hack/utilities.dart';

import 'UserPreferences.dart';

void main() {
  runApp(MyApp());
  globalActivities = getActivities();
  userSettings = new UserPreferences();
}

Activities getActivities() {
  List<Activity> _dayActivities = new List<Activity>();
  _dayActivities.add(Activity.test("Yoga", 0));
  _dayActivities.add(Activity.test("Attend Class", 2));
  _dayActivities.add(Activity.test("Sleep", 4));
  return new Activities.fromActivities(DateTime.now(), _dayActivities);
}

class MyApp extends StatelessWidget {
  static final navigatorKey = new GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScheduleHack',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        scaffoldBackgroundColor: colorBeige,
        primarySwatch: Colors.blue, //TODO: custom swatch
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: //WelcomeScreen(),
          Home(0),
    );
  }
}
