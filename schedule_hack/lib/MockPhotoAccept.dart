import 'package:flutter/material.dart';
import 'package:schedule_hack/utilities.dart';

import 'CancelButton.dart';
import 'CheckmarkButton.dart';

class MockPhotoAccept extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MockPhotoAcceptState();
  }
}

class _MockPhotoAcceptState extends State<MockPhotoAccept> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorBlackCoral,
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 2.2/3,
            child: Image.asset(
              'images/syllabus.png',
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                top: 15.0,
              ),
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CancelButton(),
                  CheckmarkButton(3)
            ],
          ),
          ),
        ],
      ),
    );
  }
}