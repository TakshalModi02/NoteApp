import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/notes_screen_bloc/notes_bloc.dart';
import '../bloc/notes_screen_bloc/notes_event.dart';
class AddNoteScreen extends StatelessWidget {
  late String title;
  late String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff757575),
        child: Container(
          padding: const EdgeInsets.only(
              top: 30, left: 30, right: 30, bottom: 30),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)),
          ),
          child: Column(
            children: [
              const Text(
                'Add Note',
                style:
                TextStyle(color: Color(0xff63c9fe), fontSize: 30),
              ),
              TextField(
                autofocus: false,
                decoration: InputDecoration(hintText: "Title"),
                textAlign: TextAlign.center,
                onChanged: (value){
                  title = value;
                },
              ),
              const SizedBox(height: 20,),
              TextField(
                autofocus: false,
                decoration: InputDecoration(hintText: "Description"),
                textAlign: TextAlign.center,
                onChanged: (value){
                  description = value;
                },
              ),
              const SizedBox(height: 20,),
              TextButton(
                onPressed: () {
                  context.read<NoteBloc>().add(AddNoteEvent(title: title, description: description));
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.lightBlueAccent,
                  child: const Text("Add", style: TextStyle(color: Colors.white, fontSize: 20),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
