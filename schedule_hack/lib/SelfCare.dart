import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/utilities.dart';

import 'SettingsButton.dart';

class SelfCare extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SelfCareState();
  }
}

class SelfCareState extends State<SelfCare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios,
          color: colorBlackCoral,
        ),
        actions: [
          Row(
            children: [SettingsButton()],
          ),
        ],
        title: Text('Self Care',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: colorBlackCoral)),
        backgroundColor: colorHoneydew,
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          SizedBox(
            child: RaisedButton(
              onPressed: null,
              child: Text('This is a test'),
            ),
          ),
          SizedBox(
            child: RaisedButton(
              onPressed: null,
              child: Text('This is another test'),
            ),
          )
        ],
      )),
    );
  }
}
