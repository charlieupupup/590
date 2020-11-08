import 'package:flutter/material.dart';
import 'package:schedule_hack/Course.dart';
import 'package:schedule_hack/utilities.dart';

import 'CancelButton.dart';
import 'CheckmarkButton.dart';

class MockPhotoAccept extends StatefulWidget {
  Course course = new Course();

  MockPhotoAccept(Course c){
    this.course = c;
  }
  @override
  State<StatefulWidget> createState() {
    return new _MockPhotoAcceptState(course);
  }
}

class _MockPhotoAcceptState extends State<MockPhotoAccept> {
  Course course;
  _MockPhotoAcceptState(Course c){
    this.course = c;
  }
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
                  CheckmarkButton(3,this.course)
            ],
          ),
          ),
        ],
      ),
    );
  }
}