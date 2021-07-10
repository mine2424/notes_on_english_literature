import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:notes_on_english_literature/domain/notes/models/note.dart';
import 'package:notes_on_english_literature/domain/notes/models/sentence.dart';
import 'package:notes_on_english_literature/domain/notes/notes_repository.dart';

class NotePageNotifier extends StateNotifier<Note> {
  NotePageNotifier({
    required this.notesRepository,
  }) : super(Note()) {}

  late NotesRepository notesRepository;

  @override
  void dispose() {
    super.dispose();
  }

  void addSentenceForLocalDB(Note note, Sentence sentence) {
    note.sentenceList = [...note.sentenceList, sentence];

    print('addSentence: $note');

    fetchSentenceForLocalDB(note.id);
  }

  void updateSentenceForLocalDB(Note note, Sentence sentence) {
    // 変更の該当sentenceを探す
    // 該当のsentenceに代入
    final sentenceList = [...note.sentenceList];

    for (var i = 0; i < note.sentenceList.length; i++) {
      if (note.sentenceList[i].id == sentence.id) {
        sentenceList[i] = sentence;
      }
    }

    fetchSentenceForLocalDB(note.id);
  }

  Future<void> fetchSentenceForLocalDB(int id) async {
    // noteのsentencelistをどう取得（更新する）か考える
  }

  void deleteSentenceForLocalDB(int id) {
    fetchSentenceForLocalDB(id);
  }
}
