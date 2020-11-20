import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/utilities.dart';

class TimeSelector extends StatefulWidget {
  TimeSelector({Key key, this.hintText, this.timeController}) : super(key: key);
  String hintText;
  TextEditingController timeController;
  @override
  _TimeSelectorState createState() =>
      _TimeSelectorState(hintText, timeController);
}

class _TimeSelectorState extends State<TimeSelector> {
  TextEditingController timeController;
  String hintText;
  _TimeSelectorState(String hint, TextEditingController c) {
    this.hintText = hint;
    this.timeController = c;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: TextField(
          readOnly: true,
          controller: timeController,
          decoration: InputDecoration(
              hintText: hintText, suffixIcon: Icon(Icons.access_alarm)),
          onTap: () async {
            var time = await showTimePicker(
              initialTime: TimeOfDay.now(),
              context: context,
              builder: (context, child) {
                return Theme(
                  data: ThemeData.from(colorScheme: setTimeColors()),
                  child: child,
                );
              },
            );
            timeController.text = time.format(context);
          },
        ),
      ),
    );
  }
}
