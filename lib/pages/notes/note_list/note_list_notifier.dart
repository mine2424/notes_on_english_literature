import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:notes_on_english_literature/domain/user/user_service.dart';
import 'package:notes_on_english_literature/domain/notes/models/note.dart';
import 'package:notes_on_english_literature/domain/notes/models/note_list.dart';
import 'package:notes_on_english_literature/domain/notes/notes_repository.dart';
import 'package:uuid/uuid.dart';

class NoteListNotifier extends StateNotifier<NoteList> {
  NoteListNotifier({
    required this.notesRepository,
    required this.userService,
    this.imagePath = '',
  }) : super(NoteList(noteList: const <Note>[])) {
    fetchNoteList();
  }

  late NotesRepository notesRepository;
  late UserService userService;
  String imagePath;

  String get uid => userService.currentUid;

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> selectedImageFromGallary(String title) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      imageQuality: 60,
    );

    imagePath = pickedFile!.path;
  }

  Future<void> addUpdateNoteList(Note note) async {
    final noteId = const Uuid().v4();

    if (imagePath == '') {
      notesRepository.addNoteListForDB(note);

      state = state.copyWith(noteList: [...state.noteList, note]);
      return;
    }

    final result = await notesRepository.addNoteImageForStorage(
      'users/$uid/myNoteLists/$noteId',
      File(imagePath),
    );

    if (result.isError) {
      print(result.asError!.error);
      return;
    }

    notesRepository.addNoteListForDB(note);

    note.imageUrl = imagePath;

    state = state.copyWith(noteList: [...state.noteList, note]);
  }

  Future<void> deleteNoteList(String noteId, Note note) async {
    await notesRepository.deleteNoteListForDB(uid, noteId);
  }

  Future<void> fetchNoteList() async {
    final result = await notesRepository.fetchNoteListForDB(uid);

    if (result.isError) {
      return;
    }

    state = state.copyWith(noteList: result.asValue!.value);
  }
}
