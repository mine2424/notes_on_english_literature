import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_on_english_literature/domain/notes/notes_repository.dart';

/// Dependency Injection

/// Repository
final notesRepositoryProvider = Provider<NotesRepository>(
  (_) => NotesRepository(),
);
