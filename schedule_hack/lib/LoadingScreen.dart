import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
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

  _LoadingScreenState(){
    list.add("Take time to practice deep breathing while we build your schedule");
    list.add("Try getting 6 - 8 hours of sleep to function at your best!");
    list.add("Daily exercise can help relieve stress and make you feel better");
    list.add("Staying hydrated helps you to learn and retain information. Try drinking 13 cups a day!");
    imageList.add(Image.asset("images/meditation.png"));
    imageList.add(Image.asset("images/sleepingbed.png"));
    imageList.add(Image.asset("images/running.png"));
    imageList.add(Image.asset("images/water.png"));
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
              child: this.imageResponse,//Image.asset(this.imageString),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              this.inspirationString,
             // "Loading",
              style: TextStyle(
                  fontSize: 20.0,
                  color: colorBlackCoral
              ),
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
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
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Home(2)
    )
    );
  }

  randomInspiration(){
    Random random = new Random();
    int randomNumber = random.nextInt(3);
    this.inspirationString = this.list[randomNumber];
    this.imageResponse = this.imageList[randomNumber];
  }
}