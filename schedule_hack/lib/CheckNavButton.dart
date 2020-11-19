import 'package:flutter/material.dart';
import 'package:schedule_hack/utilities.dart';

class CheckNavButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: null,
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
