import 'package:flutter/material.dart';

class SchduleElement extends StatelessWidget {
  final String img = 'images/running.png';
  final String event = 'Soccer';
  final String time = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Image(image: AssetImage('images/running.png')),
            Text('Soccer 3-530'),
            Icon(Icons.arrow_right),
          ],
        ));
  }
}
