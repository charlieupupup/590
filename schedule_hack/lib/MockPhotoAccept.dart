import 'package:flutter/material.dart';
import 'package:schedule_hack/Course.dart';
import 'package:schedule_hack/utilities.dart';

import 'Assignment.dart';
import 'AssignmentListHome.dart';
import 'CancelButton.dart';
import 'CheckmarkButton.dart';

class MockPhotoAccept extends StatefulWidget {
  Course course = new Course();

  MockPhotoAccept(Course c) {
    this.course = c;
    // Add fake assignments to course (mock of syllabus automatic reading)
    Assignment a1 = new Assignment.long('Share Out #1', 'T', '11:59 pm');
    Assignment a2 = new Assignment.long('Share Out #2', 'Th', '11:59 pm');
    this.course.setAssignments = a1;
    this.course.setAssignments = a2;
    //printAssignments();
  }
  // Method to print assignments for troubleshooting
  void printAssignments(){
    List list = new List();
    list = this.course.getAssignments;
    for (int i = 0; i < list.length; i++){
      String name = list[i].getDescription;
      print('Assignments:  $name');
    }
  }
  @override
  State<StatefulWidget> createState() {
    return new _MockPhotoAcceptState(course);
  }
}

class _MockPhotoAcceptState extends State<MockPhotoAccept> {
  Course course;
  _MockPhotoAcceptState(Course c) {
    this.course = c;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorBlackCoral,
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 2.2 / 3,
            child: Image.asset(
              'images/syllabus.png',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 15.0,
            ),
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CancelButton(),
                //CheckmarkButton(3,this.course)
                MaterialButton(
                  onPressed: () {
                    int courseCount = 0; // irrelevant because new entry
                    int edit = 0; // new entry
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => AssignmentListHome(2, this.course,edit,courseCount,0)//AssignmentList(),
                      ),
                          (route) => false,
                    );
                  },
                  color: colorHoneydew,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: new Text('Review',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: colorBlackCoral,
                      fontWeight: FontWeight.bold)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
