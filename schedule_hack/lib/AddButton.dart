import 'package:flutter/cupertino.dart';
import 'package:schedule_hack/utilities.dart';
import 'package:flutter/material.dart';

// Add button UI element
class AddButton extends StatelessWidget{

  AddButton();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 50,
              height: 50,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: colorHoneydew,
                onPressed: (){
                  // Respond to button press
                },
                child: Column(
                  children: <Widget>[
                    //Icon(Icons.add),
                    Image.asset('images/add.png',
                    height: 50,
                    width: 50,)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}