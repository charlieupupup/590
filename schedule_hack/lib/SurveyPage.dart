import 'SingleQuestionData.dart';

class SurveyPage {
  int pageNumber;
  String title;
  List<SingleQuestionData> questions;
  SurveyPage(String s, int n) {
    this.questions = new List<SingleQuestionData>();
    this.pageNumber = n;
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
