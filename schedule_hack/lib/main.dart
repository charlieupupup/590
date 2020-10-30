import 'package:flutter/material.dart';
import 'package:schedule_hack/Schedule.dart';
import 'package:google_fonts/google_fonts.dart';

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
        primarySwatch: Colors.blue, //TODO: custom swatch
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Schedule(title: 'ScheduleHack'),
    );
  }
}


