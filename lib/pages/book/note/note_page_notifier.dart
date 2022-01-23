import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:notes_on_english_literature/domain/notes/models/note.dart';
import 'package:notes_on_english_literature/domain/notes/models/sentence.dart';
import 'package:notes_on_english_literature/domain/notes/note_repository.dart';
import 'package:notes_on_english_literature/domain/user/user_service.dart';

class NotePageNotifier extends StateNotifier<Note> {
  NotePageNotifier({
    required this.notesRepository,
    required this.userService,
  }) : super(const Note());

  late final NoteRepository notesRepository;
  late final UserService userService;

  @override
  void dispose() {
    super.dispose();
  }

  void saveNote(Note note) {
    state = state.copyWith(
      title: note.title,
      noteId: note.noteId,
      uid: userService.currentUid,
      imageUrl: note.imageUrl,
      parentNoteId: note.parentNoteId,
      isOrigin: note.isOrigin,
      createAt: note.createAt,
      sentenceList: note.sentenceList,
    );
  }

  Future<void> addSentenceForDB(Sentence sentence) async {
    final sentenceList = [...state.sentenceList];

    sentenceList.add(sentence);

    state = state.copyWith(sentenceList: sentenceList);

    await notesRepository.addUpdateNoteListForDB(state);
  }

  Future<void> updateSentenceForDB(Note note, Sentence sentence) async {
    final sentenceList = [...note.sentenceList];

    // 変更の該当sentenceを探す、該当のsentenceに代入
    for (var i = 0; i < note.sentenceList.length; i++) {
      if (note.sentenceList[i].sentenceId == sentence.sentenceId) {
        sentenceList[i] = sentence;
      }
    }

    state = state.copyWith(sentenceList: sentenceList);

    await notesRepository.addUpdateNoteListForDB(state);

    await fetchNoteForDB(state.noteId);
  }

  Future<void> fetchSentenceForDB(String noteId) async {
    final uid = userService.currentUid;

    // final result = await notesRepository.fetchSentenceForDB(uid, noteId);
    final result = await notesRepository.fetchNoteForDB(uid, noteId);

    if (result.isError) {
      return;
    }

    final note = result.asValue!.value;

    state = state.copyWith(
      title: note.title,
      noteId: note.noteId,
      uid: note.uid,
      imageUrl: note.imageUrl,
      parentNoteId: note.parentNoteId,
      isOrigin: note.isOrigin,
      createAt: note.createAt,
      sentenceList: note.sentenceList,
    );
  }

  Future<void> fetchNoteForDB(String noteId) async {
    final uid = userService.currentUid;

    final result = await notesRepository.fetchNoteForDB(uid, noteId);

    if (result.isError) {
      return;
    }

    final note = result.asValue!.value;

    state = state.copyWith(
      title: note.title,
      noteId: note.noteId,
      uid: note.uid,
      imageUrl: note.imageUrl,
      parentNoteId: note.parentNoteId,
      isOrigin: note.isOrigin,
      createAt: note.createAt,
      sentenceList: note.sentenceList,
    );
  }

  Future<void> deleteSentenceForDB(Note note, Sentence sentence) async {
    // 変更の該当sentenceを探す、該当のsentenceを削除
    for (var i = 0; i < note.sentenceList.length; i++) {
      if (note.sentenceList[i].sentenceId == sentence.sentenceId) {
        note.sentenceList.removeAt(i);
      }
    }

    await notesRepository.addUpdateNoteListForDB(note);

    await fetchSentenceForDB(note.noteId);
  }
}
