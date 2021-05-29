import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:notes_on_english_literature/domain/notes/models/note.dart';
import 'package:notes_on_english_literature/domain/notes/notes_repository.dart';

class NotePageNotifier extends StateNotifier<Note> {
  NotePageNotifier({
    required this.notesRepository,
  }) : super(Note());

  final NotesRepository notesRepository;
}
