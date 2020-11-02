import 'package:schedule_hack/SingleQuestionData.dart';
import 'package:schedule_hack/SurveyPage.dart';

//TOP LEVEL: class contains all data associated with a user
//currently prepopulated with data for testing
//USAGE: will be loaded with question data from a csv file
class UserPreferences {
  List<SurveyPage> pages;

  UserPreferences() {
    //pages = new Set<Map<String, bool>>();
    pages = new List<SurveyPage>();
    SingleQuestionData one = new SingleQuestionData("In the morning");
    SingleQuestionData two = new SingleQuestionData("In the afternoon");
    SingleQuestionData three = new SingleQuestionData("In the evening");
    SingleQuestionData four = new SingleQuestionData("At night");
    SurveyPage page1 = new SurveyPage("I usually have the most energy...");
    page1.addQuestion(one);
    page1.addQuestion(two);
    page1.addQuestion(three);
    page1.addQuestion(four);
    pages.add(page1);
  }

  SurveyPage getSurveyPage(int num) {
    return this.pages[num];
  }
}
