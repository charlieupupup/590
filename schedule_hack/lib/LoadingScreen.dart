import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/utilities.dart';

import 'Home.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  List<String> list = new List<String>();
  List<dynamic> imageList = new List<dynamic>();
  dynamic imageResponse;
  String inspirationString;

  _LoadingScreenState() {
    list.add(
        "Take time to practice deep breathing while we build your schedule");
    list.add("Try getting 6 - 8 hours of sleep to function at your best!");
    list.add("Daily exercise can help relieve stress and make you feel better");
    list.add(
        "Staying hydrated helps you to learn and retain information. Try drinking 13 cups a day!");
    imageList
        .add(Image.asset("images/meditation.png", height: 200, width: 200));
    imageList
        .add(Image.asset("images/sleepingbed.png", height: 200, width: 200));
    imageList.add(Image.asset("images/running.png", height: 200, width: 200));
    imageList.add(Image.asset("images/water.png", height: 200, width: 200));
    randomInspiration();
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: this.imageResponse,
            ),
            //Padding(padding: EdgeInsets.only(top: 20.0)),
            Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  this.inspirationString,
                  // "Loading",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: colorBlackCoral),
                  textAlign: TextAlign.center,
                )),
            Padding(padding: EdgeInsets.only(top: 40.0)),
            CircularProgressIndicator(
              backgroundColor: colorBlackCoral,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home(0)));
  }

  randomInspiration() {
    Random random = new Random();
    int randomNumber = random.nextInt(3);
    this.inspirationString = this.list[randomNumber];
    this.imageResponse = this.imageList[randomNumber];
  }
}
