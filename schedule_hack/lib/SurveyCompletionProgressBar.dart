import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:schedule_hack/utilities.dart';

class SurveyCompletionProgressBar extends StatefulWidget {
  int currentPage;
  int totalPages;
  SurveyCompletionProgressBar(int num, int total) {
    this.currentPage = num;
    this.totalPages = total;
  }
  @override
  State<StatefulWidget> createState() {
    return new SurveyCompletionProgressBarState(
        this.currentPage, this.totalPages);
  }
}

class SurveyCompletionProgressBarState
    extends State<SurveyCompletionProgressBar> {
  int pageNumber;
  int total;
  double percentage;
  SurveyCompletionProgressBarState(int num, int t) {
    this.pageNumber = num;
    this.total = t;
    this.percentage = this.pageNumber / this.total;
  }

  @override
  Widget build(BuildContext context) {
    this.pageNumber = widget.currentPage;
    this.total = widget.totalPages;
    this.percentage = this.pageNumber / this.total;
    return new Container(
      //decoration: BoxDecoration(border: Border.all(color: colorBlackCoral)),
      child: new Column(children: <Widget>[
        Container(
            decoration:
                BoxDecoration(border: Border.all(color: colorBlackCoral)),
            child: LinearProgressIndicator(
              backgroundColor: colorPale,
              valueColor: new AlwaysStoppedAnimation<Color>(colorMelon),
              value: percentage,
              minHeight: 30,
              semanticsValue: "",
            )),
        Text("Question " + pageNumber.toString() + " of " + total.toString())
      ]),
    );
  }
}
