import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:notes_on_english_literature/domain/user/user_service.dart';
import 'package:notes_on_english_literature/pages/app/states/user_state.dart';
import 'package:notes_on_english_literature/pages/app/user_notifier.dart';

///Dependency Injection

//* Logic / StateNotifier
final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>(
  (ref) => UserNotifier(userSeivice: ref.watch(userServiceProvider)),
);

//* Repository
final userServiceProvider = Provider<UserService>(
  (_) => UserService(),
);
