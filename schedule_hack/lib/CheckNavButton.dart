import 'package:flutter/material.dart';
import 'package:schedule_hack/utilities.dart';

class CheckNavButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (_) {
              //return NewCoursePopup(nameController, startTimeController, endTimeController);
              return;
            });
      },
      backgroundColor: colorAeroBlue, //colorHoneydew,
      child: Image.asset('images/checkmark.png'),
    );
    // return MaterialButton(
    //   onPressed: null,
    //   color: colorPale,
    //   child: Image.asset(
    //     'images/checkmark.png',
    //   ),
    //   shape: CircleBorder(),
    // );
  }
}
