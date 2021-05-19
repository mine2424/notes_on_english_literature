import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:notes_on_english_literature/pages/app/app_notifier.dart';
import 'package:notes_on_english_literature/pages/app/states/app_state.dart';

///Dependency Injection

//* Logic / StateNotifier
final appNotifierProvider = StateNotifierProvider<AppNotifier, AppState>(
  (ref) => AppNotifier(),
);

//* Repository
