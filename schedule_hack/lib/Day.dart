import 'dart:core';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/utilities.dart';

class Day extends DateTime {
  List<Activity> activityTimeslots =
      List(24); //list of activities, index representing hour
  Map<int, Activity> get timeActivityMap =>
      activityTimeslots.asMap(); // map of hour to activity

//original default constructor from parent class
  Day.year(int year) : super(year);

  //constructor that initializes new Day object @ dateTime
  Day.day(DateTime dateTime)
      : super(dateTime.year, dateTime.month, dateTime.day, dateTime.hour,
            dateTime.minute);

  //constructor that initializes new Day with 'activities' planned
  factory Day.planned(DateTime dateTime, List<Activity> activities) {
    Day date = Day.day(dateTime);
    date.activityTimeslots = activities;
    return date;
  }

  //returns true if there's no activity scheduled at that hour
  bool isAvailable(hour) {
    assert(activityTimeslots.length == 24);
    if (this.activityTimeslots[hour] == null) {
      return true;
    } else {
      return false;
    }
  }

  //adds an activity to this day
  void addActivity(Activity activity) {
    if (activity.date.day == this.day) {
      //if activity takes place on this day
      //for each hour in which activity takes place
      for (int i = activity.date.hour;
          i < (activity.date.add(activity.duration)).hour;
          i++) {
        this.activityTimeslots[i] = activity; //map timeslot to activity
      }
    }
  }

  void removeActivity(Activity activity) {
    //TODO: start at start time, making timeslots from start to end of duration == null. probably need to error check that is in fact correct activity
  }

  //for testing
  void printDescription() {
    String today = "Activities on " + this.formattedDate() + ":";
    print(today);
    for (int i = 0; i < this.activityTimeslots.length; i++) {
      if (this.activityTimeslots[i] != null) {
        print(activityTimeslots[i].getInfo());
      }
    }
  }

  static void dayTest() {
    Activity yoga = new Activity(Task.attendClass, DateTime(2020),
        Duration(hours: 2), "Yoga", "2 hour long hatha flow");
    Activity hw = new Activity.assignment(yoga.date.add(Duration(hours: 5)),
        Duration(hours: 3), "ECE590 HW", "finish coding project");
    List<Activity> activities = new List<Activity>();
    activities.add(yoga);
    activities.add(hw);
    Day day = new Day.planned(DateTime(2020), activities);
    day.printDescription();
    Day newDay = new Day.day(DateTime(2020));
    newDay.addActivity(yoga);
    newDay.addActivity(hw);
    newDay.printDescription();
  }
}
