import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:schedule_hack/Assignment.dart';
import 'package:schedule_hack/CancelButton.dart';
import 'package:schedule_hack/CheckmarkButton.dart';
import 'package:schedule_hack/Course.dart';
import 'package:schedule_hack/CourseButton.dart';
import 'package:schedule_hack/JsonDataStorage.dart';
import 'package:schedule_hack/SettingsButton.dart';
import 'package:schedule_hack/NewCoursePopup.dart';
import 'package:schedule_hack/utilities.dart';

class CourseList extends StatefulWidget {
  List<dynamic> courseList = new List();
  //String assetJsonString;
  JsonDataStorage jsonDataStorage = new JsonDataStorage();

  CourseList(){
    //writeJsonLocal();
    jsonDataStorage.writeJsonLocal();
    //this.courseList = jsonDataStorage.getCourseList;
  }
  /*// parse JSON from local
  Future parseLocalJson() async {
    File jsonFile = await _localFile;
    // Read the file.
    String contents = await jsonFile.readAsString();
    final jsonResponse = jsonDecode(contents);
    this.courseList = jsonResponse;
    //writeCourse(contents);
    newEntry();
  }
  Future<String>_loadFromAsset() async {
    return await rootBundle.loadString("data/courses.json");
  }
  // parse json (jsonDecode)
  Future parseJson() async {
    String jsonString = await _loadFromAsset();
    this.assetJsonString = jsonString;
    final jsonResponse = jsonDecode(jsonString);
    print(jsonResponse[0]);
    print(jsonResponse[1]);
    Course person = Course.fromJson(jsonResponse[0]);
    print(person.getName);
    this.courseList = jsonResponse;
    writeCourse(jsonString);
  }
  // write asset json to local
  Future writeJsonLocal() async {
    String jsonString = await _loadFromAsset();
    this.assetJsonString = jsonString;
    final jsonResponse = jsonDecode(jsonString);
    writeCourse(jsonString);
    parseLocalJson();
  }
  // write new entry
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
    //writeCourse(rawJson);
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
  // Write data to file
  Future<File> writeCourse(String assetCourses) async {
    final file = await _localFile;
    // Write the file.
    return file.writeAsString(assetCourses);
  }*/
  @override
  State<StatefulWidget> createState() {
    return _CourseListState(courseList, jsonDataStorage);
  }
}
class _CourseListState extends State<CourseList> {
  final myController = TextEditingController();
  List<dynamic> courseList = new List();
  //JsonDataStorage jsonDataStorage = new JsonDataStorage();
  _CourseListState(List<dynamic> cl, JsonDataStorage storage){
    this.courseList = cl;
    //this.jsonDataStorage = storage;
    this.courseList = storage.getCourseList;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios,
          color: colorBlackCoral,
        ),
        actions: [
          Row(
            children: [
              //Icon(Icons.settings, color: colorBlackCoral),
              SettingsButton()
            ],
          ),
        ],
        title: Text('Courses',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: colorBlackCoral)),
        backgroundColor: colorHoneydew,
      ),
      bottomNavigationBar: SizedBox(
        height: 58,
        //child: T.TabBar().build(context),
      ),
      body: Container(
        child: ListView(
          children: [
            getCourseButtonWidgets()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          NewCoursePopup(context, myController);
        },
        backgroundColor: colorHoneydew,
        child: Image.asset('images/add.png'),
      ),
    );
  }

  // Create Course
  Course createCourse(String name) {
    Course c1 = new Course();
    c1.setName = name;
    return c1;
  }
  // Display course button based on json input
  Widget getCourseButtonWidgets(){
    List<Widget> list = new List<Widget>();
    for (int i = 0; i < courseList.length; i++) {
      Course course = Course.fromJson(courseList[i]);
        list.add(new CourseButton(course, i));
    }
    return new Column(children: list);
  }
}
