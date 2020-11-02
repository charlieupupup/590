import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/SingleQuestionData.dart';
import 'package:schedule_hack/utilities.dart';

//class contains to code to build out a single question tile for the survey screen
class SurveyQuestionTile extends StatefulWidget {
  SingleQuestionData q;
  SurveyQuestionTile(SingleQuestionData d) {
    this.q = d;
  }
  @override
  State<StatefulWidget> createState() {
    return _SurveyQuestionTileState(q);
  }
}

class _SurveyQuestionTileState extends State<SurveyQuestionTile> {
  SingleQuestionData data;
  _SurveyQuestionTileState(SingleQuestionData d) {
    this.data = d;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
          title: Text(data.getQuestion()),
          value: data.getAnswer(),
          controlAffinity: ListTileControlAffinity.leading,
          checkColor: colorBlackCoral,
          activeColor: colorPowderBlue,
          selected: data.getAnswer(),
          onChanged: (bool newValue) {
            setState(() {
              //answer = newValue;
              data.setAnswer(newValue);
            });
          }),
    );
  }
}
