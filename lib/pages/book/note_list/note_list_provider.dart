import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_on_english_literature/di_container.dart';
import 'package:notes_on_english_literature/pages/book/note_list/note_list_notifier.dart';
import 'package:notes_on_english_literature/pages/book/note_list/state/note_list_state.dart';

/// Dependency Injection

/// Logic / StateNotifier
final noteListNotifierProvider =
    StateNotifierProvider<NoteListNotifier, NoteListState>(
  (ref) {
    return NoteListNotifier(
      noteRepository: ref.watch(noteRepositoryProvider),
      userService: ref.watch(userServiceProvider),
    );
  },
);
