import 'package:schedule_hack/Day.dart';

enum Task { attendClass, doAssignment, sleep, takeBreak, workout }

class Activity {
  Task task;
  Duration duration;
  DateTime
      startTime; //this way, due date for Assignment - duration = start time?
  String description;

  //default constructor
  Activity(Task t, DateTime start, Duration duration, String description) {
    this.task = task;
    this.startTime = start;
    this.duration = duration;
    this.description = description;
  }
  //constructor for an assignment
  Activity.assignment(
      DateTime dueDate, Duration timeToComplete, String description) {
    this.task = task;
    this.startTime = dueDate.subtract(
        timeToComplete); //start time = time to complete assignment - dueDate
    this.duration = duration;
    this.description = description;
  }
}
