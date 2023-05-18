import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../modules/notes.dart';
import 'notes_event.dart';
import 'notes_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String docId = " ";
  NoteBloc() : super(NoteInitialState()) {
    on<AddNoteEvent>(addNote);
    on<DeleteNoteEvent>(deleteNote);
  }

  void addNote (event, emit) async{
    await _firestore.collection("Notes").add({
      "Title":event.title,
      "Description": event.description,
      "Date of Creation":FieldValue.serverTimestamp(),
    }).then((DocumentReference doc) {
      docId = doc.id;
    });
    state.notes.add(Note(title: event.title, description: event.description, id: docId));
    emit(AddNoteState(newNoteList: state.notes));
  }

  void deleteNote (event, emit){
    String id = state.notes.elementAt(event.index).id;
    try{
      _firestore.collection("Trash").doc(id).set({
        "Title": state.notes.elementAt(event.index).title,
        "Description": state.notes.elementAt(event.index).description,
        "Date of Deletion": FieldValue.serverTimestamp(),
      });
      _firestore.collection("Notes").doc(id).delete();
    }catch(e){
      print(e.toString());
    }
    state.notes.removeAt(event.index);
    emit(DeleteNoteState(updatedNoteList: state.notes));
  }
}


