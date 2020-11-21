import 'package:flutter/material.dart';
import 'package:schedule_hack/Home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule_hack/Notify.dart';
import 'package:schedule_hack/PopUp.dart';
import 'package:schedule_hack/WelcomeScreen.dart';
import 'package:schedule_hack/utilities.dart';

import 'UserPreferences.dart';

void main() {
  runApp(MyApp());
  userSettings = new UserPreferences();
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
