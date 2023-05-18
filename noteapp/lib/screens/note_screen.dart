import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/notes_screen_bloc/notes_bloc.dart';
import '../bloc/notes_screen_bloc/notes_state.dart';
import '../modules/notes.dart';
import '../utilities/note_list.dart';
import 'add_note_screen.dart';

class NoteScreen extends StatelessWidget {
  bool tick = false;
  late List<Note> tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddNoteScreen(),
              );
            },
          );
        },
        elevation: 10,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Note App',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 50),
                ),
                BlocBuilder<NoteBloc, NoteState>(
                  builder: (context, state) {
                    tasks = state.notes;
                    return Text(
                      'Notes ${state.notes.length}',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: BlocBuilder<NoteBloc, NoteState>(
                builder: (context, state) {
                  return NoteList(notes: state.notes);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
