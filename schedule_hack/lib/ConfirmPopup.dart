import 'package:flutter/cupertino.dart';
import 'package:schedule_hack/CancelButton.dart';
import 'package:schedule_hack/CheckmarkButton.dart';
import 'package:schedule_hack/Course.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/JsonDataStorage.dart';


// Class to display 'standard' popup
// text description, cancel (CancelButton.dart), and accept (CheckmarkButton.dart)
class ConfirmPopup {
  BuildContext context;
  String message;
  int index;
  Course course = new Course();
  JsonDataStorage jsonDataStorage = new JsonDataStorage();

  ConfirmPopup.course(BuildContext bc, String m, int i, Course c){
    this.course = c;
    this.context = bc;
    this.message = m;
    this.index = i;
    _showMaterialDialog2(message);
  }

  ConfirmPopup(BuildContext c, String m, int i) {
    this.context = c;
    this.message = m;
    this.index = i;
    _showMaterialDialog2(message);
  }
  // method for popup
  _showMaterialDialog2(String message){
    showDialog(context: context,
        builder: (_) => new AlertDialog(
          elevation: 16,
          actions: <Widget> [
            Center(
              child: Text(
                  message,
                  style: TextStyle(fontSize: 24, color: colorBlackCoral, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center
              ),
            ),
            Container(
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CheckmarkButton(index,course)
                ],
              ),
            )
          ],
        )
    );
  }
}