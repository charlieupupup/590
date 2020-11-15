import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/utilities.dart';

class DaySelector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DaySelectorState();
  }
}

class _DaySelectorState extends State<DaySelector> {
  var dayArray = [];
  Map<String, bool> dayValues = {
    //'Sunday': false,
    'M': false,
    'T': false,
    'W': false,
    'Th': false,
    'F': false,
    //'Saturday': false,
  };

  Widget showCaptions() {
    List<Widget> tiles = new List<Widget>();
    for (String day in dayValues.keys) {
      Text dayName = new Text(day,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.0, color: colorBlackCoral));
      tiles.add(dayName);
    }
    return new Row(
        children: tiles, mainAxisAlignment: MainAxisAlignment.spaceAround);
  }

  Widget selectDayBoxes() {
    List<Widget> tiles = new List<Widget>();
    for (String day in dayValues.keys) {
      Expanded box = new Expanded(
          child: Checkbox(
              value: dayValues[day],
              //subtitle: Text(day),
              //controlAffinity: ListTileControlAffinity.leading,
              checkColor: colorBlackCoral,
              activeColor: colorPowderBlue,
              onChanged: (bool newValue) {
                setState(() {
                  dayValues[day] = newValue;
                });
              }));
      tiles.add(box);
    }
    return new Column(
      children: <Widget>[
        new Flexible(child: showCaptions()),
        new Row(
            children: tiles, mainAxisAlignment: MainAxisAlignment.spaceAround),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Expanded(child: selectDayBoxes()),
    );
  }
}
