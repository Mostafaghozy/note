import 'package:note_app/model/note_model.dart';

class GetNotesState {}

class GetNoteInitialStates extends GetNotesState {}

class GetNoteLoadingStates extends GetNotesState {}

class GetNoteSuccessStates extends GetNotesState {
  final List<NotesModel> notes;
  GetNoteSuccessStates(this.notes);

}

class GetNoteErrorStates extends GetNotesState {
  final String errorMessage;
  GetNoteErrorStates(this.errorMessage);
}
