import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_on_english_literature/di_container.dart';
import 'package:notes_on_english_literature/domain/notes/models/note.dart';

import 'package:notes_on_english_literature/pages/book/note/note_page_notifier.dart';

/// Dependency Injection

/// Logic / StateNotifier
final notePageNotifierProvider = StateNotifierProvider<NotePageNotifier, Note>(
  (ref) {
    return NotePageNotifier(
      notesRepository: ref.watch(noteRepositoryProvider),
      userService: ref.watch(userServiceProvider),
    );
  },
);
