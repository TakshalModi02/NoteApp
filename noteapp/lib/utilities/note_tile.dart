import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final int index;
  final String title;
  final String description;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  NoteTile(
      {super.key,required this.index, required this.title, required this.description, required this.onTap, required this.onLongPress});

  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(
        title: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
          ),
          child: Text(
            "${index}. ${title}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Text(description),
        onTap: onTap,
        onLongPress: onLongPress,
      ),
    );
  }
}


















