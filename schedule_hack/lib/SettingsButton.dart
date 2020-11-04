import 'package:schedule_hack/IntakeSurvey.dart';
import 'package:schedule_hack/UserPreferences.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsButtonState();
  }
}

class _SettingsButtonState extends State<SettingsButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => IntakeSurvey(new UserPreferences())));
        },
        child: Icon(Icons.settings, color: colorBlackCoral),
        color: colorHoneydew);
  }
}
