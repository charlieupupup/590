import 'package:flutter/material.dart';
import 'package:schedule_hack/Course.dart';
import 'package:schedule_hack/utilities.dart';
import 'MockPhotoAccept.dart';

// Class to mock photo taking capabilities (functionality not implemented)
class MockPhoto extends StatefulWidget {
  Course course = new Course();
  MockPhoto(Course c){
    this.course = c;
  }
  @override
  State<StatefulWidget> createState() {
    return new _MockPhotoState(course);
  }
}

class _MockPhotoState extends State<MockPhoto> {
  Course course;
  _MockPhotoState(Course c){
    this.course = c;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorBlackCoral,
      padding: EdgeInsets.only(
        top: 30.0,
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
              child: MaterialButton(onPressed: (){
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => MockPhotoAccept(this.course),
                  ),
                      (route) => false,
                );
              },
                  color: colorMelon,
                  child: Image.asset(
                    'images/camera.png',
                    height: 50,
                    width: 50,
                  ),
                  shape: CircleBorder()
              )
          ),
        ],
      ),
    );
  }
}