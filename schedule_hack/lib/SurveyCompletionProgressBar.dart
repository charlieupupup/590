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
    return SurveyCompletionProgressBarState(this.currentPage, this.totalPages);
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
    return SizedBox(
        child: LinearProgressIndicator(
      backgroundColor: colorHoneydew,
      valueColor: new AlwaysStoppedAnimation<Color>(colorAlmond),
      value: percentage,
      minHeight: 30,
    ));
  }
}
