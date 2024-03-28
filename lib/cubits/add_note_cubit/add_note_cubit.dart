import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_flutter/constants.dart';
import 'package:notes_flutter/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color? color = const Color(0xff60296d);
  addNote(NoteModel note) async {
    note.color = color!.value;
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
