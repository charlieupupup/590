//Class containing the data associate with a  single survey question

class SingleQuestionData {
  String question = "";
  bool answer = false;

  SingleQuestionData(String s) {
    question = s;
    answer = false;
  }
  void setAnswer(bool b) {
    this.answer = b;
  }

  String getQuestion() {
    return this.question;
  }

  bool getAnswer() {
    return this.answer;
  }
}
