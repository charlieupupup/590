import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateSelector extends StatefulWidget {
  String hintText;
  TextEditingController dateController;
  //DateSelector({Key key, this.hintText, this.dateController}) : super(key: key);
  DateSelector({Key key, this.hintText, this.dateController}) : super(key: key);

  @override
  _DateSelectorState createState() =>
      //_DateSelectorState(hintText, dateController);
      _DateSelectorState(hintText, dateController);
}

class _DateSelectorState extends State<DateSelector> {
  //final dateController = TextEditingController();
  TextEditingController dateController;
  String hintText;
  //_DateSelectorState(String hint) {
  _DateSelectorState(String hint, TextEditingController controller) {
    this.hintText = hint;
    //this.dateController = controller;
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
          child: TextField(
        readOnly: true,
        controller: dateController,
        decoration: InputDecoration(hintText: hintText),
        onTap: () async {
          var date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100));
          dateController.text =
              date.toString().substring(0, 10); //save to json to send back out
        },
      )),
    );
  }
}
