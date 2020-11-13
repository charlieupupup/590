import 'dart:async';

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
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Home(0)
    )
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("images/hack.png"),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "Loading",
              style: TextStyle(
                  fontSize: 20.0,
                  color: colorBlackCoral
              ),
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
  /*@override
  Widget build(BuildContext context) => FutureBuilder(
        future: Future.delayed(Duration(seconds: 5), () => print('Wait done')),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return savedScreen();
          } else {
            print('Still loading');
            return loadingScreen();
          }
        },
      );
  Widget loadingScreen(){
    return Container(
      child: Text(
        'Loading'
      ),
    );
  }
  Widget savedScreen(){
    return Container(
      child: Text(
          'Saved'
      ),
    );
  }*/
}