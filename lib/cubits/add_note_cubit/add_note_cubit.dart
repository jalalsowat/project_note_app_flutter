import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_flutter/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  AddNote(NoteModel) {}
}
