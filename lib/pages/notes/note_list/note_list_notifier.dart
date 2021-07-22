import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import 'package:notes_on_english_literature/domain/user/user_service.dart';
import 'package:notes_on_english_literature/domain/notes/models/note.dart';
import 'package:notes_on_english_literature/domain/notes/models/note_list.dart';
import 'package:notes_on_english_literature/domain/notes/notes_repository.dart';

class NoteListNotifier extends StateNotifier<NoteList> {
  NoteListNotifier({
    required this.notesRepository,
    required this.userService,
  }) : super(NoteList(noteList: const <Note>[])) {
    fetchNoteList();
  }

  late NotesRepository notesRepository;
  late UserService userService;

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

    state = state.copyWith(imagePath: pickedFile!.path);
  }

  Future<void> addUpdateNoteList(Note note) async {
    final noteId = const Uuid().v4();

    note.noteId = noteId;
    note.uid = userService.currentUid;

    if (state.imagePath == '') {
      notesRepository.addNoteListForDB(note);

      state = state.copyWith(noteList: [...state.noteList, note]);
      return;
    }

    final result = await notesRepository.addNoteImageForStorage(
      'users/$uid/myNoteLists/$noteId',
      File(state.imagePath),
    );

    if (result.isError) {
      print(result.asError!.error);
      return;
    }

    note.imageUrl = result.asValue!.value;

    notesRepository.addNoteListForDB(note);

    state = state.copyWith(noteList: [...state.noteList, note]);
  }

  Future<void> updateNoteList(Note note) async {
    // TODO: 調整する
    if (state.imagePath == '') {
      notesRepository.addNoteListForDB(note);

      state = state.copyWith(noteList: [...state.noteList, note]);
      return;
    }

    final result = await notesRepository.addNoteImageForStorage(
      'users/${note.uid}/myNoteLists/${note.noteId}',
      File(state.imagePath),
    );

    if (result.isError) {
      print(result.asError!.error);
      return;
    }

    note.imageUrl = result.asValue!.value;

    notesRepository.addNoteListForDB(note);

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
