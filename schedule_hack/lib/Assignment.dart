
// Object to hold Assignment information
// Ability to set and get assignment description, due time, and due date
class Assignment {
  String description;
  String dueDate;
  String dueTime;

  Assignment();
  Assignment.long(String d, String dueD, String t){
    this.description = d;
    this.dueDate = dueD;
    this.dueTime = t;
  }
  Assignment.fromJson(Map<String, dynamic> json):description=json['name'],dueDate=json['date'],dueTime=json['time'];

  Map toJson() => {
    'name': description,
    'date': dueDate,
    'time': dueTime
  };

  // Getters
  String get getDescription{
    return description;
  }
  String get getDueTime{
    return dueTime;
  }
  String get getDueDate{
    return dueDate;
  }
  // Setters
  set setDescription(String t){
    this.description = t;
  }
  set setDueDate(String t){
    this.dueDate = t;
  }
  set setDueTime(String t){
    this.dueTime = t;
  }
}