import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/logic/create_note_cubit/state.dart';
import 'package:note_app/model/note_model.dart';

class CreateNoteCubit extends Cubit<CreateNoteStates> {
  CreateNoteCubit() : super(CreateNoteInitialStates());

  /// function to create note /// add Notes
  Future createNote(NotesModel notes) async {
    emit(CreateNoteLoadingStates());
    try {
      await FirebaseFirestore.instance.collection('notes').add(notes.toMap());
      emit(CreateNoteSuccessStates());
    } catch (e) {
      emit(CreateNoteErrorStates(e.toString()));
    }
  }
}
