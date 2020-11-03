import 'package:flutter/cupertino.dart';
import 'package:schedule_hack/CancelButton.dart';
import 'package:schedule_hack/CheckmarkButton.dart';
import 'package:schedule_hack/Course.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:flutter/material.dart';

class NewCoursePopup {
  BuildContext context;
  TextEditingController myController;

  NewCoursePopup(BuildContext c, TextEditingController controller){
    this.context = c;
    this.myController = controller;
    _showMaterialDialog();
  }


  _showMaterialDialog(){
    showDialog(context: context,
        builder: (_) => new AlertDialog(
          elevation: 16,
          title: new Text(
              'Course Name',
              style: TextStyle(fontSize: 24, color: colorBlackCoral, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center
          ),
          content: new Row(
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                    controller: myController,
                    decoration: new InputDecoration(
                      hintText: 'Course Name'
                    ),
                  ),
              )
            ],
          ),
          actions: <Widget> [
            Container(
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CancelButton(),
                  CheckmarkButton.course(0,myController.text)
                ],
              ),
            )
          ],
        )
    );
  }
}