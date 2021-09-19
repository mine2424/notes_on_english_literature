import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:notes_on_english_literature/domain/app/app_service.dart';
import 'package:notes_on_english_literature/domain/notes/note_repository.dart';
import 'package:notes_on_english_literature/pages/app/app_notifier.dart';
import 'package:notes_on_english_literature/pages/app/states/app_state.dart';

import 'package:notes_on_english_literature/domain/user/user_service.dart';
import 'package:notes_on_english_literature/pages/app/states/user_state.dart';
import 'package:notes_on_english_literature/pages/app/user_notifier.dart';

/// Dependency Injection Container

/// Logic / StateNotifier
final appNotifierProvider = StateNotifierProvider<AppNotifier, AppState>(
  (ref) => AppNotifier(appService: ref.watch(appServiceProvider)),
);

/// Repository
final appServiceProvider = Provider<AppService>(
  (_) => AppService(),
);

/// Repository
final userServiceProvider = Provider<UserService>(
  (_) => UserService(),
);

/// Logic / StateNotifier
final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>(
  (ref) => UserNotifier(userSeivice: ref.watch(userServiceProvider)),
);

/// Repository
final noteRepositoryProvider =
    Provider<NoteRepository>((_) => NoteRepository());
