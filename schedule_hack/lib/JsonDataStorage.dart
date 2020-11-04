

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
    // Read the file.
    String contents = await jsonFile.readAsString();
    final jsonResponse = jsonDecode(contents);
    this.courseList = jsonResponse;
    //newEntry();
  }
  // Write data to file
  Future<File> writeCourse(String assetCourses) async {
    final file = await _localFile;
    // Write the file.
    return file.writeAsString(assetCourses);
  }


  // write new entry - temp
  void newEntry(){
    Course c = new Course();
    c.setName = 'Test';
    Map<String, dynamic> map = c.toJson();
    String rawJson = jsonEncode(map);
    this.courseList.add(map);
    print(courseList[0]);
    print(courseList[1]);
    print(courseList[2]);
    String allJson = jsonEncode(courseList);
    writeCourse(allJson);
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