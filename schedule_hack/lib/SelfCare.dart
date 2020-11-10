import 'package:auto_size_text/auto_size_text.dart';
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
          child: ListView(
            children: [
              SizedBox(
                width: 300,
                height: 150,
                child: Card(
                  margin: EdgeInsets.all(6.0),
                  elevation: 4.0,
                  color: colorMelon,
                  child: Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      "This is the self care banner",
                      style: TextStyle(fontSize: 24, color: colorIvory),
                      maxLines: 1,
                      minFontSize: 20,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 160.0,
                    height: 300.0,
                    color: Colors.transparent,
                    margin: EdgeInsets.all(6.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: colorAeroBlue,
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: RaisedButton(
                        color: colorAeroBlue,
                        onPressed: () {},
                        child: Text('Check-In'),
                      ),
                    ),
                  ),
                  Container(
                    width: 160.0,
                    height: 300.0,
                    color: Colors.transparent,
                    margin: EdgeInsets.all(6.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: colorPowderBlue,
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: RaisedButton(
                        color: colorPowderBlue,
                        onPressed: () {},
                        child: Text('Check-Out'),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
