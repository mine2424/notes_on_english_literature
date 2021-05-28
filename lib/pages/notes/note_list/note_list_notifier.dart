import 'dart:io';

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
  File? imageFile;

  Future<void> selectedImageFromGallary() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      imageQuality: 60,
    );

    imageFile = File(pickedFile!.path);
  }

  void addUpdateNoteListForLocalDB(Note note) {
    notesRepository.addUpdateNoteListForLocalDB(note);
  }

  Future<void> fetchNoteListForLocalDB() async {
    final list = await notesRepository.fetchNoteListForLocalDB();
    state = state.copyWith(noteList: list);
  }
}
