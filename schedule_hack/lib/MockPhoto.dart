import 'package:flutter/material.dart';
import 'package:schedule_hack/utilities.dart';
import 'MockPhotoAccept.dart';

// Class to mock photo taking capabilities (functionality not implemented)
class MockPhoto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MockPhotoState();
  }
}

class _MockPhotoState extends State<MockPhoto> {
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
              child: MaterialButton(onPressed: (){
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => MockPhotoAccept(),
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