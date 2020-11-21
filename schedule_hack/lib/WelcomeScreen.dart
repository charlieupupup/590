import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/utilities.dart';

import 'IntakeSurvey.dart';

//just a placeholder, useless
class WelcomeScreen extends StatelessWidget {
  WelcomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: colorPewterBlue,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 35.0,
                ),
                child: new Text(
                  'scheduleHack',
                  style: TextStyle(
                    color: colorIvory,
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 4,
                 // textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10.0
                ),
                child: new Text(
                  'Welcome!',
                  style: TextStyle(
                    color: colorIvory,
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 3,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15.0,
                  right: 8.0,
                  left: 8.0
                ),
                child: new Text(
                  'Help us crack the code to your balanced routine by answering a few questions',
                  style: TextStyle(
                    color: colorIvory,
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 1,
                  textAlign: TextAlign.center,
                ),
              ),
              MaterialButton(
                height: 50,
                //padding: EdgeInsets.only(top: 2.0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IntakeSurvey(userSettings)));
                },
                child: new Text('Get Started',
                    style: TextStyle(fontSize: 20.0, color: colorBlackCoral)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                color: colorHoneydew,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
