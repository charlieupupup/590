

import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:schedule_hack/Course.dart';

import 'package:flutter/services.dart';

class JsonDataStorage {
  List<dynamic> courseList = new List();

  List<dynamic> get getCourseList{
    writeJsonLocal();
    return this.courseList;
  }

  List<dynamic> get getJustCourseList{
    return this.courseList;
  }


  // write asset json to local phone storage
  Future writeJsonLocal() async {
    final path = await _localPath;
    // exists
    if (await File('$path/courses.json').exists()){
      parseLocalJson();
    } else {
      String jsonString = await _loadFromAsset();
      writeCourse(jsonString);
      parseLocalJson();
    }
  }
  // load course.json from asset folder in Project (only access once, can't access on phone / emulator)
  Future<String>_loadFromAsset() async {
    return await rootBundle.loadString("data/courses.json");
  }
  // parse JSON from local and apply to courseList to display
  Future parseLocalJson() async {
    File jsonFile = await _localFile;
    // Read the file
    List<dynamic> jsonResponse = jsonDecode(await jsonFile.readAsString());
    this.courseList = jsonResponse;
  }
  // Write data to file
  Future<File> writeCourse(String assetCourses) async {
    final file = await _localFile;
    // Write the file.
    return file.writeAsString(assetCourses);
  }

  // write new entry
  Future newEntry(Course c) async{
    File jsonFile = await _localFile;
    // Read the file.
    //String contents = await jsonFile.readAsString();
    try{
      String stringResponse = await jsonFile.readAsString();
      List<dynamic> jsonResponse = jsonDecode(stringResponse); // why decode?
      //final jsonResponse = jsonDecode(stringResponse);
      this.courseList = jsonResponse;
      Map<String, dynamic> map = c.toJson();
      this.courseList.add(map);
      String allJson = jsonEncode(courseList);
      writeCourse(allJson);
    } on FormatException catch(e){
      print('error caught: $e');
      //newEntry(c);
    }
  }
  // edit entry
  Future editEntry(int index, Course course) async {
    // get file and set to courseList
    File jsonFile = await _localFile;
    //String contents = await jsonFile.readAsString();
    List<dynamic> jsonResponse = jsonDecode(await jsonFile.readAsString());
    this.courseList = jsonResponse;
    // Make course json
    Map<String, dynamic> map = this.courseList[index];
    Map<String, dynamic> courseMap = course.toJson();
    Course c = Course.fromJson(map);
    String name = c.getName;
    print('Course Name:  $name');
    this.courseList.add(courseMap);
    int indexMap = this.courseList.indexOf(map);
    if (indexMap != -1){
      print('Index Edit Entry:  $indexMap');
      this.courseList.remove(map);
      //this.courseList.insert(indexMap, courseMap);
    }

    // rewrite courseList as json and save locally
    writeCourse(jsonEncode(this.courseList));
  }
  // delete entry
  Future deleteEntry(int index) async {
    // Get file and set to courseList
    File jsonFile = await _localFile;
    List<dynamic> jsonResponse = jsonDecode(await jsonFile.readAsString());
    this.courseList = jsonResponse;
    // Make course json
    Map<String, dynamic> map = this.courseList[index];
    Course c = Course.fromJson(map);
    String name = c.getName;
    print('Course Name:  $name');
    // Check if course exists in list and delete it
    if (this.courseList.indexOf(map) != -1){
      print('Index:  $index');
      this.courseList.remove(map);
    }
    // rewrite courseList as json and save locally
    writeCourse(jsonEncode(this.courseList));
  }
  // Find document directory
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }
  // Reference to file location
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/courses.json');
  }

}