import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_on_english_literature/common/helpers/heplers.dart';
import 'package:notes_on_english_literature/common/types/status.dart';
import 'package:notes_on_english_literature/domain/user/models/user.dart';
import 'package:notes_on_english_literature/domain/user/user_repository.dart';

import 'package:notes_on_english_literature/domain/user/user_service.dart';
import 'package:notes_on_english_literature/pages/app/states/user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier({
    required this.userSeivice,
    required this.userRepository,
  }) : super(const UserState());

  final UserService userSeivice;
  final UserRepository userRepository;

  Future<void> listenAuthStatus() async {
    final authStatus = await userSeivice.listenAuthStatus();

    if (authStatus == AuthStatus.error) {
      return;
    }

    state = state.copyWith(authStatus: authStatus);

    return;
  }

  Future<AuthStatus> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final result =
        await userSeivice.createUserWithEmailAndPassword(email, password);

    if (result.isError) {
      if (result.asError!.error == 'weak-password') {
        return AuthStatus.weakPassword;
      } else if (result.asError!.error == 'email-already-in-use') {
        return AuthStatus.emailAlreadyExists;
      }
    }

    userRepository.addUser(User(
      uid: result.asValue!.value.user!.uid,
      signInMethod: Helpers.enumToString(AuthStatus.email),
    ));

    return AuthStatus.email;
  }

  Future<bool> signinWithEmailAndPassword(String email, String password) async {
    final result =
        await userSeivice.signInWithEmailAndPassword(email, password);

    if (result.isError) {
      print(result.asError!.error);
      return false;
    }

    return true;
  }

  Future<bool> signInWithGoogle() async {
    final result = await userSeivice.signInWithGoogle();

    if (result.isError) {
      print(result.asError!.error);
      return false;
    }

    final user = await userRepository.fetchUser(
      User(uid: result.asValue!.value.user!.uid),
    );

    if (user.asValue!.value.uid == '') {
      userRepository.addUser(User(
        uid: result.asValue!.value.user!.uid,
        signInMethod: Helpers.enumToString(AuthStatus.google),
      ));
    }

    return true;
  }

  Future<bool> signInWithApple() async {
    final result = await userSeivice.signInWithApple();

    if (result.isError) {
      print(result.asError!.error);
      return false;
    }

    final user = await userRepository.fetchUser(
      User(uid: result.asValue!.value.user!.uid),
    );

    if (user.asValue!.value.uid == '') {
      userRepository.addUser(User(
        uid: result.asValue!.value.user!.uid,
        signInMethod: Helpers.enumToString(AuthStatus.apple),
      ));
    }

    return true;
  }

  Future<void> signOut() async {
    await userSeivice.signOut();
  }
}
