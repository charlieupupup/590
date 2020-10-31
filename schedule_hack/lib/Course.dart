import 'package:schedule_hack/Assignment.dart';
// Object to hold course information
// Ability to set and get course name, time, date, and assignments
class Course {
  String courseName;
  String courseTime;
  String courseDate;
  List courseDays = new List();
  List assignments = new List();

  Course();
  // Constructor
  Course.long(String name, String time, String date, List dayofweek, List a){
    this.courseName = name;
    this.courseTime = time;
    this.courseDate = date;
    this.courseDays = dayofweek;
    this.assignments = a;
  }

  // Getters
  String get getName{
    return courseName;
  }
  String get getTime{
    return courseTime;
  }
  String get getDate{
    return courseDate;
  }
  List get getCourseDays{
    return courseDays;
  }
  List get getAssignments{
    return assignments;
  }
  // Setters
  set setAssignments(Assignment a){
    this.assignments.add(a);
  }
  set setCourseDays(String s){
    this.courseDays.add(s);
  }
  set setName(String n){
    this.courseName = n;
  }
  set setTime(String t){
    this.courseTime = t;
  }
  set setDate(String d){
    this.courseDate = d;
  }
}