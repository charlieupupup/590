import 'package:schedule_hack/SingleQuestionData.dart';
import 'package:schedule_hack/SurveyPage.dart';

//TOP LEVEL: class contains all data associated with a user
//currently prepopulated with data for testing
//USAGE: will be loaded with question data from a csv file
class UserPreferences {
  List<SurveyPage> pages;

  UserPreferences() {
    pages = new List<SurveyPage>();
    SurveyPage page1 = new SurveyPage("I usually have the most energy...", 1);
    SingleQuestionData one = new SingleQuestionData("In the morning");
    SingleQuestionData two = new SingleQuestionData("In the afternoon");
    SingleQuestionData three = new SingleQuestionData("In the evening");
    SingleQuestionData four = new SingleQuestionData("At night");
    page1.addQuestion(one);
    page1.addQuestion(two);
    page1.addQuestion(three);
    page1.addQuestion(four);
    pages.add(page1);
    SurveyPage page2 = new SurveyPage("In my freetime I enjoy...", 2);
    SingleQuestionData one2 = new SingleQuestionData("Reading");
    SingleQuestionData two2 = new SingleQuestionData("watching star wars");
    SingleQuestionData three2 = new SingleQuestionData("Running");
    SingleQuestionData four2 = new SingleQuestionData("Yoga");
    page2.addQuestion(one2);
    page2.addQuestion(two2);
    page2.addQuestion(three2);
    page2.addQuestion(four2);
    pages.add(page2);
    SurveyPage page3 = new SurveyPage("When stressed, I like to...", 3);
    SingleQuestionData one3 = new SingleQuestionData("Sleep");
    SingleQuestionData two3 = new SingleQuestionData("Hang out with friends");
    SingleQuestionData three3 =
        new SingleQuestionData("Watch TV / stream TV / play video games");
    SingleQuestionData four3 = new SingleQuestionData("Exercise");
    page3.addQuestion(one3);
    page3.addQuestion(two3);
    page3.addQuestion(three3);
    page3.addQuestion(four3);
    pages.add(page3);
    SurveyPage page4 =
        new SurveyPage("How early do you typically start assignments?", 4);
    SingleQuestionData one4 =
        new SingleQuestionData("As soon as it is assigned");
    SingleQuestionData two4 = new SingleQuestionData("1 - 2 weeks");
    SingleQuestionData three4 = new SingleQuestionData("1-2 days");
    SingleQuestionData four4 = new SingleQuestionData("Depends on my schedule");
    SingleQuestionData five4 =
        new SingleQuestionData("Depends on estimated time to complete");
    page4.addQuestion(one4);
    page4.addQuestion(two4);
    page4.addQuestion(three4);
    page4.addQuestion(four4);
    page4.addQuestion(five4);
    pages.add(page4);
    SurveyPage page5 = new SurveyPage("How do you do your best studying?", 5);
    SingleQuestionData one5 = new SingleQuestionData("In silence");
    SingleQuestionData two5 = new SingleQuestionData("With music");
    SingleQuestionData three5 = new SingleQuestionData("At home");
    SingleQuestionData four5 = new SingleQuestionData("In the library");
    SingleQuestionData five5 = new SingleQuestionData("With friends");
    SingleQuestionData six5 = new SingleQuestionData("In short bursts");
    SingleQuestionData seven5 = new SingleQuestionData("In long stretches");
    page5.addQuestion(one5);
    page5.addQuestion(two5);
    page5.addQuestion(three5);
    page5.addQuestion(four5);
    page5.addQuestion(five5);
    page5.addQuestion(six5);
    page5.addQuestion(seven5);
    pages.add(page5);
    SurveyPage page6 =
        new SurveyPage("How often do you find yourself missing deadlines?", 6);
    SingleQuestionData one6 = new SingleQuestionData("Never");
    SingleQuestionData two6 = new SingleQuestionData("Almost never");
    SingleQuestionData three6 = new SingleQuestionData("Sometimes");
    SingleQuestionData four6 = new SingleQuestionData("Fairly Often");
    SingleQuestionData five6 = new SingleQuestionData("Very Often");
    page6.addQuestion(one6);
    page6.addQuestion(two6);
    page6.addQuestion(three6);
    page6.addQuestion(four6);
    page6.addQuestion(five6);
    pages.add(page6);
    SurveyPage page7 = new SurveyPage("Describe your sleeping pattern", 7);
    SingleQuestionData one7 =
        new SingleQuestionData("Early to bed early to rise (7-8 hours)");
    SingleQuestionData two7 =
        new SingleQuestionData("Early to bed late to rise (7-8 hours)");
    SingleQuestionData three7 =
        new SingleQuestionData("Late to bed early to rise (5-6 hours)");
    SingleQuestionData four7 =
        new SingleQuestionData("Late to bed late to rise (8-9 hours)");
    page7.addQuestion(one7);
    page7.addQuestion(two7);
    page7.addQuestion(three7);
    page7.addQuestion(four7);
    pages.add(page7);
    SurveyPage page8 = new SurveyPage(
        "How frequent would you like to receive feedback on your current progress?",
        8);
    SingleQuestionData one8 = new SingleQuestionData("Never");
    SingleQuestionData two8 = new SingleQuestionData("Daily");
    SingleQuestionData three8 = new SingleQuestionData("Weekly");
    SingleQuestionData four8 = new SingleQuestionData("Bi-weekly");
    SingleQuestionData five8 = new SingleQuestionData("Monthly");
    page8.addQuestion(one8);
    page8.addQuestion(two8);
    page8.addQuestion(three8);
    page8.addQuestion(four8);
    page8.addQuestion(five8);
    pages.add(page8);
  }

  SurveyPage getSurveyPage(int num) {
    return this.pages[num];
  }

  int getTotalPages() {
    return this.pages.length;
  }
}
