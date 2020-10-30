import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/utilities.dart';


class DateBanner extends StatelessWidget {
  DateBanner({Key key, this.date}) : super(key: key);
  final String date;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 300,
      height: 75,
      child: Row(
        children: [
          Text(
            date,
            style: TextStyle(
                fontSize: 24,
                color: colorIvory),

          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      decoration: BoxDecoration(color: colorMelon),
    );
  }
}
