import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/Assignment.dart';
import 'package:schedule_hack/utilities.dart';
import 'CancelButton.dart';
import 'CheckmarkButton.dart';
import 'Course.dart';

import 'SettingsButton.dart';

// Class to display and interact with list of assignments
class AssignmentList extends StatefulWidget{
  Course course;
  AssignmentList(Course c){
    this.course = c;
  }
  @override
  State<StatefulWidget> createState() {
    return new _AssignmentListState(this.course);
  }
}

class _AssignmentListState extends State<AssignmentList> {
  final myControllerDescription = TextEditingController();
  final myControllerTime = TextEditingController();
  final myControllerDate = TextEditingController();
  Course course;
  int _currentIndex = 2;
  _AssignmentListState(Course c){
    this.course = c;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerDescription.dispose();
    myControllerTime.dispose();
    myControllerDate.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios,
          color: colorBlackCoral,
        ),
        actions: [
          Row(
            children: [
              SettingsButton()
            ],
          ),
        ],
        title: Text('Assignments',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: colorBlackCoral)),
        backgroundColor: colorHoneydew,
      ),
      bottomNavigationBar: SizedBox(
        height: 58,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CancelButton.assignment(5),
            CheckmarkButton(4, this.course)
          ],
        ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showMaterialDialog();
        },
        backgroundColor: colorHoneydew,
        child: Image.asset('images/add.png'),
      ),
    );
  }

  // Add new assignment popup
  _showMaterialDialog(){
    MainAxisAlignment alignment = MainAxisAlignment.end;
    showDialog(context: context,
        builder: (_) => new AlertDialog(
          elevation: 16,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          content: Container(
            height: 280,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'ADD ASSIGNMENT',
                      style: TextStyle(fontSize: 24, color: colorBlackCoral, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center
                  ),
                  TextFormField(
                    controller: myControllerDescription,
                    decoration: InputDecoration(
                        hintText: 'Name'
                    ),
                  ),
                  TextFormField(
                    controller: myControllerDate,
                    decoration: InputDecoration(
                        hintText: 'Due Date'
                    ),
                  ),
                  TextFormField(
                    controller: myControllerTime,
                    decoration: InputDecoration(
                        hintText: 'Due Time'
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0
                    ),
                    child: ButtonBar(
                      alignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CancelButton(),
                        saveAssignment(),
                        //CheckmarkButton.course(0,myController)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
  Widget saveAssignment(){
    return MaterialButton(
      onPressed: (){
        Assignment a = new Assignment.long(myControllerDescription.text, myControllerDate.text, myControllerTime.text);
        this.course.setAssignments = a;
        printText();
        Navigator.of(context).pop();
      },
      color: colorHoneydew,
      child: Image.asset(
        'images/checkmark.png',
        height: 50,
        width: 50,
      ),
      shape: CircleBorder(),
    );
  }
  void printText(){
    String data;
    data = myControllerDescription.text;
    String date = myControllerDate.text;
    String time = myControllerTime.text;
    print('Description: $data');
    print('Date: $date');
    print('Time: $time');
  }
}