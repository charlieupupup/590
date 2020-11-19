import 'package:flutter/cupertino.dart';
import 'package:schedule_hack/CancelButton.dart';
import 'package:schedule_hack/StandardPopup.dart';
import 'package:schedule_hack/PlaceHolderWidget.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:flutter/material.dart';

import 'AssignmentListHome.dart';
import 'Course.dart';

class SyllabusPopup {
  BuildContext context;
  Course course;

  SyllabusPopup(BuildContext bc, Course c) {
    this.context = bc;
    this.course = c;
    _showMaterialDialog();
  }

  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              backgroundColor: colorBeige,
              elevation: 16,
              actions: <Widget>[
                Center(
                  child: Text(
                    'Syllabus Upload Options',
                    style: TextStyle(
                        fontSize: 24,
                        color: colorBlackCoral,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                _buildButton('MANUAL', 1),
                _buildButton('PHOTO', 2),
                _buildButton('PDF', 3),
                FlatButton(
                  child: Text('Back'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  // Build individual buttons for popup (manual, photo, pdf)
  Widget _buildButton(String buttonName, int index) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: colorPowderBlue,
          onPressed: () {
            // Handle onPressed
            switch (index) {
              case 1:
                {
                  int courseCount = 0; // does not matter
                  // Take user right to adding assignments manually
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AssignmentListHome(
                            2, this.course,0,courseCount,0,this.course)
                        ),
                    (route) => false,
                  );
                  break;
                }
              case 2:
                {
                  String message =
                      'Take a photo of your syllabus to automatically upload assignment due dates. You will have the '
                      'opportunity to manually add assignments';
                  //_showMaterialDialog2(message);
                  //StandardPopup(context, message,1);
                  StandardPopup.course(context, message, 1, course);
                  break;
                }
              case 3:
                {
                  // TODO: Change page to pdf upload (are we doing this one?)
                  break;
                }
              default:
                {
                  Navigator.of(context).pop();
                  break;
                }
            }
          },
          child: Container(
            child: Row(
              children: [
                Text(
                  buttonName,
                  style: TextStyle(
                      fontSize: 24,
                      color: colorBlackCoral,
                      fontWeight: FontWeight.bold),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            width: 150,
            height: 40,
          ),
        ),
      ),
    );
  }
}
