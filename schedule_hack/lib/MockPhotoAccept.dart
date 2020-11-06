import 'package:flutter/material.dart';
import 'package:schedule_hack/utilities.dart';

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
          Image.asset(
            'images/syllabus.png',
            height: 580,
            width: 600,
            fit: BoxFit.contain,
          ),
          Padding(
              padding: EdgeInsets.only(
                top: 15.0,
              ),
              child: Row(

              ),
          ),
        ],
      ),
    );
  }
}