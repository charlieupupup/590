import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/utilities.dart';

import 'SettingsButton.dart';

// Class to display and interact with list of assignments
class AssignmentList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _AssignmentListState();
  }
}

class _AssignmentListState extends State<AssignmentList> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //NewCoursePopup(context, myController);
          // New assignment popup
        },
        backgroundColor: colorHoneydew,
        child: Image.asset('images/add.png'),
      ),
    );
  }
}