import 'package:schedule_hack/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Class that builds cancel (x) red button
// Takes in index to know where to pass user next depending on where used
class CancelButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CancelButtonState();
  }
}
class _CancelButtonState extends State<CancelButton>{
    @override
    Widget build(BuildContext context) {
      return MaterialButton(
          onPressed: (){
            // cancel just go back to last page (pop)
            Navigator.of(context).pop();
          },
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
