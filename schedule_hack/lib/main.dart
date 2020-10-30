import 'package:flutter/material.dart';
import 'package:schedule_hack/Schedule.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule_hack/utilities.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScheduleHack',
      theme: ThemeData(
        scaffoldBackgroundColor: colorBeige,
        primarySwatch: Colors.blue, //TODO: custom swatch
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Schedule(
          title: 'ScheduleHack',
          date: DateTime.now()), //initialize with today's date
    );
  }
}
