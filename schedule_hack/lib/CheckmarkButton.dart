import 'package:schedule_hack/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Class that builds checkmark green button
// Takes in index to know where to pass user next depending on where used
class CheckmarkButton extends StatefulWidget {
  int index;
  CheckmarkButton(int i){
    this.index = i;
  }
  @override
  State<StatefulWidget> createState() {
    return _CheckmarkButtonState();
  }
}
class _CheckmarkButtonState extends State<CheckmarkButton>{
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){},
      color: colorHoneydew,
      child: Image.asset(
        'images/checkmark.png',
        height: 50,
        width: 50,
      ),
      shape: CircleBorder(),
    );
  }
}