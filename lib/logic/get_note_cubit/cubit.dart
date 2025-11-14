import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/logic/get_note_cubit/state.dart';
import 'package:note_app/model/note_model.dart';

class GetNoteCubit extends Cubit<GetNotesState> {
  GetNoteCubit() : super(GetNoteInitialStates());

  /// Get Notes
  Future getNotes() async {
    emit(GetNoteLoadingStates());

    try {
      final getData =
          await FirebaseFirestore.instance.collection("notes").get();
      final notes = getData.docs
          .map((doc) => NotesModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
      emit(GetNoteSuccessStates(notes));
    } catch (e) {
      emit(GetNoteErrorStates(e.toString()));
    }
  }
}
