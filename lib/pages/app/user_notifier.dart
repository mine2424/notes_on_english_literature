import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_on_english_literature/common/types/status.dart';
import 'package:notes_on_english_literature/domain/user/user_service.dart';
import 'package:notes_on_english_literature/pages/app/states/user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier({
    required this.userSeivice,
  }) : super(const UserState());

  final UserService userSeivice;

  Future<AuthStatus> listenAuthStatus() async {
    final result = await userSeivice.listenAuthStatus();

    if (result.isError) {
      // TODO: errorの判別考える
      return AuthStatus.networkError;
    }

    return result.asValue!.value;
  }

  Future<bool> signInAnonymously() async {
    final result = await userSeivice.signInAnonymously();

    if (result.isError) {
      // TODO: error handling
      print(result.asError!.error);
      return false;
    }
    print('logined');
    return true;
  }
}
