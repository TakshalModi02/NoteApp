import 'package:flutter/material.dart';

class ShowNote extends StatelessWidget {
  final String title;
  final String description;

  ShowNote({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Title', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(title),
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(description),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
