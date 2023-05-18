import 'package:taskapp/modules/notes.dart';

abstract class NoteState {
    List<Note> notes;
    NoteState({required this.notes});
}

class NoteInitialState extends NoteState {
    NoteInitialState():super(notes: []);
}

class AddNoteState extends NoteState{
    List<Note> newNoteList;
    AddNoteState({required this.newNoteList}): super(notes: newNoteList);
}

class DeleteNoteState extends NoteState{
    List<Note> updatedNoteList;
    DeleteNoteState({required this.updatedNoteList}):super(notes: updatedNoteList);
}
