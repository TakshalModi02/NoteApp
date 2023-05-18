abstract class NoteEvent {

}

class AddNoteEvent extends NoteEvent{
  String title;
  String description;

  AddNoteEvent({required this.title, required this.description});
}


class DeleteNoteEvent extends NoteEvent{
  int index;
  DeleteNoteEvent({required this.index});
}


