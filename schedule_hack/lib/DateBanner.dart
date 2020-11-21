import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedule_hack/utilities.dart';

class DateBanner extends StatefulWidget {
  DateBanner({Key key, this.date}) : super(key: key);
  DateTime date;

  @override
  State<StatefulWidget> createState() {
    return _DateBannerState(date);
  }
}

class _DateBannerState extends State<DateBanner> {
  DateTime _date;
  String _banner;

  String getAbbreviatedDateString() {
    return DateFormat.yMMMEd('en_US').format(_date);
  }

  String getDateString() {
    return DateFormat.yMMMMEEEEd('en_US').format(_date);
  }

  _DateBannerState(DateTime date) {
    _date = date;
    _banner = getAbbreviatedDateString();
  }

  _DateBannerState createState() => _DateBannerState(_date);

  @override
  void initState() {
    super.initState();
  }

  void subtractDate() {
    this._date = _date.subtract(Duration(days: 1));
  }

  void addDate() {
    this._date = _date.add(Duration(days: 1));
  }

  @override
  Widget build(BuildContext context) {
    double arrowWidth = 24;
    var padding = MediaQuery.of(context).padding;
    double width =
        MediaQuery.of(context).size.width - padding.left - padding.right;
    double height =
        MediaQuery.of(context).size.height - padding.top - padding.bottom;
    return SizedBox(
      width: width,
      height: height / 10,
      child: Card(
        // margin: EdgeInsets.all(6.0),
        elevation: 4.0,
        color: colorMelon,

        child: Row(
          children: <Widget>[
            Flexible(
              child: MaterialButton(
                  child: Icon(
                    (Icons.arrow_back_ios),
                    color: colorIvory,
                  ),
                  onPressed: () {
                    setState(() => subtractDate());
                    print("date is now ${this._date}");
                  }),
            ),
            Container(
              constraints: BoxConstraints.expand(
                width: width - (4 * arrowWidth),
              ),
              child: Align(
                //alignment: Alignment.center,
                child: AutoSizeText(
                  getDateString(), //Sunday, November 15, 2020
                  style: TextStyle(fontSize: 22, color: colorIvory),
                  maxLines: 1,
                  minFontSize: 20,
                  textAlign: TextAlign.center,
                  overflowReplacement: AutoSizeText(
                    getAbbreviatedDateString(), //Sun, Nov 15, 2020
                    style: TextStyle(fontSize: 24, color: colorIvory),
                    maxLines: 2,
                    minFontSize: 20.0,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Flexible(
              child: MaterialButton(
                  child: Icon(
                    (Icons.arrow_forward_ios),
                    color: colorIvory,
                  ),
                  onPressed: () {
                    setState(() => addDate());
                    print("date is now ${this._date}");
                  }),
            )
          ],
        ),
      ),
    );
  }
}
