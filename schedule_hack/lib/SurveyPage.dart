import 'SingleQuestionData.dart';

class SurveyPage {
  int pageNumber = 0;
  String title;
  List<SingleQuestionData> questions;
  SurveyPage(String s) {
    this.questions = new List<SingleQuestionData>();
    this.pageNumber++;
    this.title = s;
  }
  SingleQuestionData getQuestion(int num) {
    return this.questions[num];
  }

  String getPageTitle() {
    return this.title;
  }

  List<SingleQuestionData> getAllQuestions() {
    return this.questions;
  }

  void addQuestion(SingleQuestionData d) {
    this.questions.add(d);
  }

  int getNumberOfQuestions() {
    return questions.length;
  }
}
