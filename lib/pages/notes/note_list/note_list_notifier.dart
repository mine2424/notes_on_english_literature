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
  }) : super(NoteList(noteList: const <Note>[])) {
    notesRepository.initialized();
    // fetchNoteListForLocalDB();
  }

  late NotesRepository notesRepository;
  late UserService userService;

  String get uid => userService.currentUid;

  @override
  void dispose() {
    notesRepository.dispose();
    super.dispose();
  }

  Future<void> selectedImageFromGallary(String title) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      imageQuality: 60,
    );

    state = state.copyWith(imagePath: pickedFile!.path);
  }

  Future<void> addUpdateNoteListForLocalDB(Note note) async {
    // TODO: storageに送信
    final uuid = const Uuid().v4();

    final result = await notesRepository.addNoteImageForStorage(
      'users/$uid/myNoteLists',
      File(state.imagePath),
    );

    if (result.isError) {
      return;
    }

    state = state.copyWith(
      noteList: [...state.noteList, note],
      imagePath: result.asValue!.value,
    );
    notesRepository.addNoteListForDB(uid, uuid, state);
    fetchNoteListForDB();
  }

  Future<void> fetchNoteListForDB() async {
    final result = await notesRepository.fetchNoteListForDB(uid);

    if (result.isError) {
      return;
    }

    state = state.copyWith(noteList: result.asValue!.value);
  }
}
