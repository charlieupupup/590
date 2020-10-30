import 'package:flutter/material.dart';

class TabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIcon(Colors.white, Icons.school, 'Schedule'),
          _buildIcon(Colors.white, Icons.favorite, 'Self-Care'),
          _buildIcon(Colors.white, Icons.calendar_today, 'Courses'),
        ],
      ),
    );
  }

  Column _buildIcon(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
