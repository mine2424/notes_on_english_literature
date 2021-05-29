import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_on_english_literature/di_container.dart';

import 'package:notes_on_english_literature/domain/notes/models/note_list.dart';
import 'package:notes_on_english_literature/pages/notes/note_list/note_list_notifier.dart';

/// Dependency Injection

/// Logic / StateNotifier
final noteListNotifierProvider =
    StateNotifierProvider<NoteListNotifier, NoteList>((ref) {
  return NoteListNotifier(notesRepository: ref.watch(notesRepositoryProvider));
});
