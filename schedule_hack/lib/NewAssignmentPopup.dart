import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/utilities.dart';

import 'CancelButton.dart';
import 'CheckmarkButton.dart';

class NewAssignmentPopup {
  BuildContext context;
  TextEditingController myController;

  NewAssignmentPopup(BuildContext buildContext, TextEditingController controller){
    this.context = buildContext;
    _showMaterialDialog();
    this.myController = controller;
  }

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
                decoration: InputDecoration(
                  hintText: 'Name'
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Due Date'
                ),
              ),
              TextFormField(
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
                    //CheckmarkButton.course(0,myController)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    )
   /* builder: (_) => new AlertDialog(
      elevation: 16,
      actions: <Widget> [
        Container(
          child: new Padding(
              padding: EdgeInsets.only(

              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                CancelButton(),
                CheckmarkButton(0)
              ],
            ),
          ),
          /*child: ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CancelButton(),
              CheckmarkButton(0)
            ],
          ),*/
        )
      ],
    )*/
    );
  }
}