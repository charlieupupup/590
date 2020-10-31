// Object to hold course information
// Ability to set and get course name, time, and date
class Course {
  String courseName;
  String courseTime;
  String courseDate;

  Course();
  // Constructor
  Course.long(String name, String time, String date){
    this.courseName = name;
    this.courseTime = time;
    this.courseDate = date;
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
  // Setters
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