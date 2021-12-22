import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_on_english_literature/common/types/status.dart';

import 'package:notes_on_english_literature/domain/user/user_service.dart';
import 'package:notes_on_english_literature/pages/app/states/user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier({
    required this.userSeivice,
  }) : super(const UserState());

  final UserService userSeivice;

  Future<void> listenAuthStatus() async {
    final authStatus = await userSeivice.listenAuthStatus();

    if (authStatus == AuthStatus.error) {
      return;
    }

    state = state.copyWith(authStatus: authStatus);

    return;
  }

  Future<bool> signInAnonymously() async {
    final result = await userSeivice.signInAnonymously();

    if (result.isError) {
      print(result.asError!.error);
      return false;
    }
    print('logined');
    return true;
  }
}
