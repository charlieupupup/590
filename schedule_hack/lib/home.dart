import 'package:flutter/material.dart';
import 'package:schedule_hack/info.dart';

import 'menu.dart';

MaterialApp home() {
  return MaterialApp(
    title: 'ScheduleHack',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: Home(title: 'ScheduleHack'),
  );
}

class Home extends StatelessWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.settings),
            ],
          ),
        ],
        title: Text('ScheduleHack'),
        backgroundColor: Colors.green[100],
      ),
      bottomNavigationBar: SizedBox(
        height: 58,
        child: menu,
      ),
      body: Container(
        child: ListView(
          children: [Info(info: 'hi drew')],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
