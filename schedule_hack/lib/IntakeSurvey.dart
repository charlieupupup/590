import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/CancelButton.dart';
import 'package:schedule_hack/SurveyQuestionTile.dart';
import 'package:schedule_hack/UserPreferences.dart';
import 'package:schedule_hack/utilities.dart';

import 'StandardPopup.dart';
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

  Widget showButtons() {
    String fwdButton;
    MainAxisAlignment alignment = MainAxisAlignment.end;
    List<Widget> navButtons = new List<Widget>();
    if (pageNumber > 0) {
      alignment = MainAxisAlignment.spaceBetween;
      FlatButton backButton = FlatButton(
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
      );
      navButtons.add(backButton);
    }
    if (pageNumber + 1 < userPreferences.getTotalPages()) {
      fwdButton = "Next";
    } else {
      fwdButton = "Finish";
    }
    FlatButton nextButton = FlatButton(
      onPressed: () {
        //increase pageNumber and save user preferences
        setState(() {
          if (pageNumber + 1 < userPreferences.getTotalPages()) {
            //only update if pages are available
            pageNumber++;
          } else {
            surveyDone = true;
            String message = 'Confirm and complete Survey?';
            //_showMaterialDialog2(message);
            StandardPopup(context, message, 2); // 2 takes user home
            //Navigator.push(context, MaterialPageRoute(builder: (context) => Home(0)));
          }
        });
      },
      child: new Text(fwdButton,
          style: TextStyle(fontSize: 20.0, color: colorBlackCoral)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      color: colorAeroBlue,
    );
    navButtons.add(nextButton);
    return new Row(mainAxisAlignment: alignment, children: navButtons);
  }

  Widget exitOption() {
    if (surveyDone) {
      return new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [exitButton()],
      );
    }
    return new Text("Please answer survey to completion",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12.0, color: colorBlackCoral));
  }

  Widget exitButton() {
    return MaterialButton(
      onPressed: () {
        // cancel just go back to last page (pop)
        Navigator.of(context).pop();
      },
      color: colorMelon,
      child: Image.asset(
        'images/delete.png',
        height: 20,
        width: 20,
      ),
      shape: CircleBorder(),
    );
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
              exitOption(),
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
          child: showButtons(),
        ));
  }
}
