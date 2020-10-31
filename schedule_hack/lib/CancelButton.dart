import 'package:schedule_hack/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Class that builds cancel (x) red button
// Takes in index to know where to pass user next depending on where used
class CancelButton extends StatefulWidget {
  int index;
  CancelButton(int i){
    this.index = i;
  }
  @override
  State<StatefulWidget> createState() {
    return _CancelButtonState();
  }
}
class _CancelButtonState extends State<CancelButton>{
    @override
    Widget build(BuildContext context) {
      return MaterialButton(
          onPressed: (){},
        color: colorMelon,
        child: Image.asset(
          'images/delete.png',
          height: 50,
          width: 50,
        ),
        shape: CircleBorder(),
      );
    }
}
