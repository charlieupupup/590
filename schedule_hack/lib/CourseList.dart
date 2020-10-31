import 'package:flutter/material.dart';
import 'package:schedule_hack/AddButton.dart';
import 'package:schedule_hack/CancelButton.dart';
import 'package:schedule_hack/CheckmarkButton.dart';
import 'package:schedule_hack/Course.dart';
import 'package:schedule_hack/CourseButton.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:intl/intl.dart';
//import 'package:schedule_hack/TabBar.dart' as T;

class CourseList extends StatelessWidget {
  CourseList();

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
              Icon(Icons.settings, color: colorBlackCoral),
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
            AddButton(),
            CourseButton(createCourse('ECE 590: TDC'),0),
            CourseButton(createCourse('ECE 651: Software Engineering'),1)
          ],
        ),
      ),
    );
  }

  // Create Course
  Course createCourse(String name){
    Course c1 = new Course();
    c1.setName = name;
    return c1;
  }

}