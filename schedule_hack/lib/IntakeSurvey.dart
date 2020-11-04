import 'package:flutter/material.dart';
import 'package:schedule_hack/SurveyQuestionTile.dart';
import 'package:schedule_hack/UserPreferences.dart';
import 'package:schedule_hack/utilities.dart';

//class contains the actual UI visualization of the survey completion
class IntakeSurvey extends StatelessWidget {
  int pageNumber = 0;
  UserPreferences userPreferences;
  IntakeSurvey(UserPreferences prefs, {Key key}) : super(key: key) {
    this.userPreferences = prefs;
    this.pageNumber++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: colorMelon,
        //decoration: BoxDecoration(border: Border.all(color: colorBlackCoral)),
        child: ListView(
          children: <Widget>[
            //createQuestions(userPreferences.getPrefs(1)),
            new Text(
                userPreferences.getSurveyPage(pageNumber - 1).getPageTitle(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26.0, color: colorBlackCoral)),
            new Text("(check all that apply)",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, color: colorBlackCoral)),
            SurveyQuestionTile(userPreferences.getSurveyPage(0).getQuestion(0)),
            SurveyQuestionTile(userPreferences.getSurveyPage(0).getQuestion(1)),
            SurveyQuestionTile(userPreferences.getSurveyPage(0).getQuestion(2)),
            SurveyQuestionTile(userPreferences.getSurveyPage(0).getQuestion(3)),
          ],
        ),
      ),
    );
  }

  void loadQuestions() {
    for (int i = 0;
        i < userPreferences.getSurveyPage(pageNumber).getNumberOfQuestions();
        i++) {
      SurveyQuestionTile(userPreferences.getSurveyPage(i).getQuestion(i));
    }
  }
}
