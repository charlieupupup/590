import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateBanner extends StatelessWidget {
  DateBanner({Key key, this.info}) : super(key: key);
  final String info;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        children: [
          Text(
            info,
            style: TextStyle(fontSize: 100),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      decoration: BoxDecoration(color: Colors.red),
    );
  }
}
