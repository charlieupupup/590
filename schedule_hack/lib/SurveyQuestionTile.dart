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
  State<SurveyQuestionTile> createState() {
    return new _SurveyQuestionTileState(q);
  }
}

class _SurveyQuestionTileState extends State<SurveyQuestionTile> {
  SingleQuestionData data;
  _SurveyQuestionTileState(SingleQuestionData d) {
    this.data = d;
  }
  @override
  Widget build(BuildContext context) {
    this.data = widget.q;
    return new Card(
      color: colorBeige,
      child: CheckboxListTile(
          title: new Text(
            data.getQuestion(),
            style:
                TextStyle(fontWeight: FontWeight.bold, color: colorBlackCoral),
          ),
          value: data.getAnswer(),
          controlAffinity: ListTileControlAffinity.leading,
          checkColor: colorBlackCoral,
          activeColor: colorAeroBlue,
          selected: data.getAnswer(),
          onChanged: (bool newValue) {
            setState(() {
              data.setAnswer(newValue);
            });
          }),
    );
  }
}
