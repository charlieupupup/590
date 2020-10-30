// Object to hold course information
// Ability to set and get course name, time, and date
class Course {
  String courseName;
  String courseTime;
  String courseDate;

  // Constructor
  Course(String name, String time, String date){
    this.courseName = name;
    this.courseTime = time;
    this.courseDate = date;
  }

  // Getters
  String getName(){
    return courseName;
  }
  String getTime(){
    return courseTime;
  }
  String getDate(){
    return courseDate;
  }
  // Setters
  void setName(String n){
    this.courseName = n;
  }
  void setTime(String t){
    this.courseTime = t;
  }
  void setDate(String d){
    this.courseDate = d;
  }
}