import 'package:flutter/material.dart';
import 'package:schedule_hack/SurveyQuestionTile.dart';
import 'package:schedule_hack/UserPreferences.dart';
import 'package:schedule_hack/utilities.dart';

import 'SurveyCompletionProgressBar.dart';

//class contains the actual UI visualization of the survey completion
class IntakeSurvey extends StatefulWidget {
  int pageNumber;
  UserPreferences userPreferences;
  IntakeSurvey(UserPreferences prefs, {Key key}) : super(key: key) {
    this.userPreferences = prefs;
    this.pageNumber = 0;
  }

  @override
  State<StatefulWidget> createState() {
    return new IntakeSurveyState(userPreferences);
  }
}

class IntakeSurveyState extends State<IntakeSurvey> {
  int pageNumber;
  UserPreferences userPreferences;

  IntakeSurveyState(UserPreferences prefs) {
    this.userPreferences = prefs;
    this.pageNumber = 0;
  }
  Widget loadQuestions() {
    List<Widget> questionsList = new List<Widget>();
    for (int i = 0;
        i < userPreferences.getSurveyPage(pageNumber).getNumberOfQuestions();
        i++) {
      SurveyQuestionTile q = SurveyQuestionTile(
          userPreferences.getSurveyPage(pageNumber).getQuestion(i));
      questionsList.add(q);
    }
    return new Column(children: questionsList);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
          padding: const EdgeInsets.all(8.0),
          color: colorAlmond,
          //decoration: BoxDecoration(border: Border.all(color: colorBlackCoral)),
          child: ListView(
            children: <Widget>[
              new Text(userPreferences.getSurveyPage(pageNumber).getPageTitle(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26.0, color: colorBlackCoral)),
              new Text("(check all that apply)",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, color: colorBlackCoral)),
              loadQuestions(),
              SurveyCompletionProgressBar(
                  pageNumber + 1, userPreferences.getTotalPages()),
            ],
          ),
        ),
        bottomNavigationBar: new Container(
          padding: const EdgeInsets.all(8.0),
          color: colorAlmond,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                onPressed: () {
                  //decrease pageNumber and save user preferences
                  setState(() {
                    if (pageNumber - 1 >= 0) {
                      //only update if pages are available
                      pageNumber--;
                    }
                  });
                },
                child: new Text("Back",
                    style: TextStyle(fontSize: 20.0, color: colorBlackCoral)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: colorSoftMelon,
              ),
              FlatButton(
                onPressed: () {
                  //increase pageNumber and save user preferences
                  setState(() {
                    if (pageNumber + 1 < userPreferences.getTotalPages()) {
                      //only update if pages are available
                      pageNumber++;
                    }
                  });
                },
                child: new Text("Next",
                    style: TextStyle(fontSize: 20.0, color: colorBlackCoral)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: colorAeroBlue,
              ),
            ],
          ),
        ));
  }
}
