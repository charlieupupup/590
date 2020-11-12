import 'package:flutter/material.dart';
import 'package:schedule_hack/Home.dart';
import 'package:schedule_hack/SelfCare.dart';
import 'package:schedule_hack/utilities.dart';

import 'main.dart';

class PopUp extends AlertDialog {
  final String msg1 = 'Great to hear!';
  final String msg2 = 'Head to the self care tab to destress';
  final String op1 = 'Good!';
  final String op2 = 'Not Great...';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: colorAlmond,
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              msg1,
              textAlign: TextAlign.center,
            ),
            Text(
              msg2,
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text(op1),
              color: colorAeroBlue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GladPopUp()),
                );
              },
            ),
            FlatButton(
              child: Text(op2),
              color: colorMelon,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SadPopUp()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MidPopUp extends PopUp {
  final String msg1 = 'Midterm Complete!';
  final String msg2 = 'How do you feel?';
  final String op1 = 'Good!';
  final String op2 = 'Not Great...';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: colorAlmond,
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              msg1,
              textAlign: TextAlign.center,
            ),
            Text(
              msg2,
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text(op1),
              color: colorAeroBlue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GladPopUp()),
                );
              },
            ),
            FlatButton(
              child: Text(op2),
              color: colorMelon,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SadPopUp()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GladPopUp extends PopUp {
  final String msg1 = 'Great to hear!';
  final String msg2 = 'Head to the self care tab to destress';
  final String op1 = 'Take me there!';
  final String op2 = 'No thanks';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: colorAlmond,
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              msg1,
              textAlign: TextAlign.center,
            ),
            Text(
              msg2,
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text(op1),
              color: colorAeroBlue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelfCare()),
                );
              },
            ),
            FlatButton(
              child: Text(op2),
              color: colorMelon,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home(0)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SadPopUp extends PopUp {
  final String msg1 = 'Sorry to hear that';
  final String msg2 = 'Head to the self care tab to destress';
  final String op1 = 'Take me there!';
  final String op2 = 'No thanks';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: colorAlmond,
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              msg1,
              textAlign: TextAlign.center,
            ),
            Text(
              msg2,
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text(op1),
              color: colorAeroBlue,
              onPressed: () {
                MyApp.navigatorKey.currentState
                    .push(MaterialPageRoute(builder: (context) => Home(0)));
              },
            ),
            FlatButton(
              child: Text(op2),
              color: colorMelon,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home(0)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
