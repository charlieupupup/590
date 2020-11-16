import 'package:flutter/material.dart';

class SchduleElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Text('Soccer 3-530'),
            Icon(Icons.arrow_right),
          ],
        ));
  }
}
