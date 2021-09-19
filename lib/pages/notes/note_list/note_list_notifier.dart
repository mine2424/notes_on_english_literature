import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import 'package:notes_on_english_literature/domain/user/user_service.dart';
import 'package:notes_on_english_literature/domain/notes/models/note.dart';
import 'package:notes_on_english_literature/domain/notes/models/note_list.dart';
import 'package:notes_on_english_literature/domain/notes/note_repository.dart';

class NoteListNotifier extends StateNotifier<NoteListState> {
  NoteListNotifier({
    required this.noteRepository,
    required this.userService,
  }) : super(NoteListState(noteList: const <Note>[])) {
    fetchNoteList();
  }

  late NoteRepository noteRepository;
  late UserService userService;

  String get uid => userService.currentUid;

  @override
  void dispose() {
    super.dispose();
  }

  void clearImagePath() => state = state.copyWith(imagePath: '');

  Future<void> selectedImageFromGallary() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      imageQuality: 60,
    );

    state = state.copyWith(imagePath: pickedFile!.path);
  }

  Future<void> addNoteList(String title) async {
    final noteId = const Uuid().v4();
    var imageUrl = '';

    if (state.imagePath.isNotEmpty) {
      final result = await noteRepository.addNoteImageForStorage(
        'users/$uid/myNoteLists/$noteId',
        File(state.imagePath),
      );

      if (result.isError) {
        print(result.asError!.error);
        return;
      }

      imageUrl = result.asValue!.value;
    }

    final note = Note(
      noteId: noteId,
      uid: userService.currentUid,
      title: title,
      imageUrl: imageUrl,
      isOrigin: true,
    );

    await noteRepository.addUpdateNoteListForDB(note);
    state = state.copyWith(noteList: [...state.noteList, note]);
    clearImagePath();
  }

  Future<void> updateNoteList(Note note) async {
    var imageUrl = '';

    if (state.imagePath.isNotEmpty) {
      final result = await noteRepository.addNoteImageForStorage(
        'users/${note.uid}/myNoteLists/${note.noteId}',
        File(state.imagePath),
      );

      if (result.isError) {
        return;
      }

      imageUrl = result.asValue!.value;
    }

    final newNote = Note(
      title: note.title,
      uid: note.uid,
      noteId: note.noteId,
      imageUrl: imageUrl,
      sentenceList: note.sentenceList,
      parentNoteId: note.parentNoteId,
      isOrigin: note.isOrigin,
    );

    final updatingNote = state.noteList
        .where((element) => element.noteId == newNote.noteId)
        .first;

    final noteIndex = state.noteList.indexOf(updatingNote);

    await noteRepository.addUpdateNoteListForDB(newNote);
    state = state.copyWith(
      noteList: state.noteList
        ..remove(updatingNote)
        ..insert(noteIndex, newNote),
    );
    clearImagePath();
  }

  Future<void> deleteNoteList(Note note) async {
    await noteRepository.deleteNoteListForDB(note.uid, note.noteId);
  }

  Future<void> fetchNoteList() async {
    final result = await noteRepository.fetchNoteListForDB(uid);

    if (result.isError) {
      return;
    }

    state = state.copyWith(noteList: result.asValue!.value);
  }
}
