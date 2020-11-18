import 'package:flutter/material.dart';
import 'package:schedule_hack/utilities.dart';

class SchduleElement extends StatelessWidget {
  final String img = 'images/running.png';
  final String event = 'Soccer';
  final String time = '3-530';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(20),
      // child: Container(
      //   color: colorPale,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Image(image: AssetImage(img)),
      //       Text(event + ' ' + time),
      //       Icon(Icons.arrow_forward_ios),
      //     ],
      //   ),
      // ),
    );
  }
}
