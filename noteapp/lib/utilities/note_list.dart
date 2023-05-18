import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskapp/utilities/show_note_box.dart';
import 'package:taskapp/utilities/note_tile.dart';

import '../bloc/notes_screen_bloc/notes_bloc.dart';
import '../bloc/notes_screen_bloc/notes_event.dart';
import '../modules/notes.dart';

class NoteList extends StatelessWidget {
  final List<Note> notes;
  NoteList({required this.notes});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return NoteTile(
            index: index+1,
            title: notes[index].title,
            description: notes[index].description,
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ShowNote(
                    title: notes[index].title,
                    description: notes[index].description,
                  );
                },
              );
            },
            onLongPress: (){
              context.read<NoteBloc>().add(DeleteNoteEvent(index: index));
            },);
        },
        itemCount: notes.length,
      ),
    );
  }
}
