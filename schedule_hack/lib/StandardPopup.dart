import 'package:flutter/cupertino.dart';
import 'package:schedule_hack/CancelButton.dart';
import 'package:schedule_hack/CheckmarkButton.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:flutter/material.dart';

// Class to display 'standard' popup
// text description, cancel (CancelButton.dart), and accept (CheckmarkButton.dart)
class StandardPopup {
  BuildContext context;
  String message;
  StandardPopup(BuildContext c, String m) {
    this.context = c;
    this.message = m;
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
                  CancelButton(),
                  CheckmarkButton(1)
                ],
              ),
            )
          ],
        )
    );
  }
}