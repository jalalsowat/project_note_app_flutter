import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_flutter/constants.dart';
import 'package:notes_flutter/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box(kNotesBox);
      emit(AddNoteSuccess());
      await noteBox.add(note);
    } catch (e) {
      AddNoteFailure(e.toString());
    }
  }
}
