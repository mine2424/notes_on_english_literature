import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:notes_on_english_literature/domain/notes/models/note.dart';
import 'package:notes_on_english_literature/domain/notes/models/note_list.dart';
import 'package:notes_on_english_literature/domain/notes/notes_repository.dart';

class NoteListNotifier extends StateNotifier<NoteList> {
  NoteListNotifier({
    required this.notesRepository,
  }) : super(NoteList(noteList: const <Note>[])) {
    fetchNoteListForLocalDB();
  }

  final NotesRepository notesRepository;

  Future<void> selectedImageFromGallary(String title) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      imageQuality: 60,
    );

    state = state.copyWith(imagePath: pickedFile!.path);
  }

  Future<void> addUpdateNoteListForLocalDB(Note note) async {
    await notesRepository.addUpdateNoteListForLocalDB(note);
    await fetchNoteListForLocalDB();
  }

  Future<void> fetchNoteListForLocalDB() async {
    final list = await notesRepository.fetchNoteListForLocalDB();
    state = state.copyWith(noteList: list);
  }

  Future<void> deleteNoteListForLocalDB(int id) async {
    await notesRepository.deleteNoteListForLocalDB(id);
    await fetchNoteListForLocalDB();
  }
}
