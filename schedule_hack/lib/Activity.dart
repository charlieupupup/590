import 'package:schedule_hack/Day.dart';
import 'package:schedule_hack/utilities.dart';

enum Task { attendClass, doAssignment, sleep, takeBreak, workout }

class Activity {
  Task task;
  Duration duration;
  DateTime
      startTime; //this way, due date for Assignment - duration = start time?
  String description;

  String getInfo() {
    return description +
        "(" +
        task.toString() +
        ") on " +
        startTime.abbreviatedDate() +
        "for " +
        duration.inHours.toString() +
        " hours starting " +
        startTime.toUtc().toString().substring(10, 16);
  }

  //default constructor
  Activity(Task task, DateTime start, Duration duration, String description) {
    this.task = task;
    this.startTime = start;
    this.duration = duration;
    this.description = description;
  }
  //constructor for an assignment
  Activity.assignment(
      DateTime dueDate, Duration timeToComplete, String description) {
    this.task = Task.doAssignment;
    this.startTime = dueDate.subtract(
        timeToComplete); //start time = time to complete assignment - dueDate
    this.duration = timeToComplete;
    this.description = description;
  }

  //TODO: course constructor that will add in repeat? or maybe ClassAttendance subclass of Activity with some kind of list of DaysOfWeek

}
