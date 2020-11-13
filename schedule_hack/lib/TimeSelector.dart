import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/utilities.dart';

class TimeSelector extends StatefulWidget {
  TimeSelector({Key key, this.hintText}) : super(key: key);
  String hintText;
  @override
  _TimeSelectorState createState() => _TimeSelectorState(hintText);
}

class _TimeSelectorState extends State<TimeSelector> {
  final timeController = TextEditingController();
  String hintText;
  _TimeSelectorState(String hint) {
    this.hintText = hint;
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
      child: Expanded(
          child: TextField(
        readOnly: true,
        controller: timeController,
        decoration: InputDecoration(hintText: hintText),
        onTap: () async {
          var time = await showTimePicker(
            initialTime: TimeOfDay.now(),
            context: context,
          );
          timeController.text = time.format(context);
        },
      )),
    ));
  }
}
