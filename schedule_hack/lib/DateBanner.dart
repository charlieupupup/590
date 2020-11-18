import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedule_hack/utilities.dart';

class DateBanner extends StatelessWidget {
  DateBanner({Key key, this.date}) : super(key: key);
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 75,
      // child: Card(
      //   margin: EdgeInsets.all(6.0),
      //   elevation: 4.0,
      //   color: colorMelon,
      //   child: Align(
      //     alignment: Alignment.center,
      //     child: AutoSizeText(
      //       DateFormat.yMMMMEEEEd('en_US')
      //           .format(date), //Sunday, November 15, 2020
      //       style: TextStyle(fontSize: 24, color: colorIvory),
      //       maxLines: 1,
      //       minFontSize: 20,
      //       textAlign: TextAlign.center,
      //       overflowReplacement: AutoSizeText(
      //           DateFormat.yMMMEd('en_US').format(date), //Sun, Nov 15, 2020
      //           style: TextStyle(fontSize: 24, color: colorIvory),
      //           maxLines: 1,
      //           minFontSize: 20.0,
      //           textAlign: TextAlign.center),
      //     ),
      //   ),
      // ),

      child: Row(
        children: [
          IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: null),
          IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: null),
        ],
      ),
    );
  }
}
