import 'package:flutter/material.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/utilities.dart';

class SchduleElement extends StatelessWidget {
  String img = 'images/running.png';
  String event = 'Soccer';
  String time = '3-530';
  Icon icon;

  SchduleElement(Activity activity) {
    this.time = activity.date.hour.toString();
    this.event = activity.title;
    // this.img = activity.title;
    icon = activity.icon;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(10),
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
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: null,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: colorPale,
          ),
          // color: colorPale,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image(image: AssetImage(img)),
              icon,
              Text(event),
              Text(time),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
