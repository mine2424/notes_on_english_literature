import 'dart:async';

import 'package:async/async.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_on_english_literature/common/types/status.dart';

class UserService {
  final _auth = FirebaseAuth.instance;

  String get currentUid => _auth.currentUser!.uid;

  Future<AuthStatus> listenAuthStatus() async {
    final currentUser = _auth.currentUser;

    try {
      if (currentUser?.uid == null) {
        return AuthStatus.none;
      }

      if (currentUser!.isAnonymous) {
        return AuthStatus.anonymous;
      } else {
        return AuthStatus.somethingLogin;
      }
    } on Exception catch (e) {
      print(e);
      return AuthStatus.error;
    }
  }

  Future<Result<String>> signInAnonymously() async {
    late UserCredential result;

    try {
      result = await _auth.signInAnonymously();
    } on Exception catch (e) {
      return Result.error(e);
    }

    return Result.value(result.user!.uid);
  }

  /// email認証をユーザーに紐付ける
  Future<Result<bool>> linkWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (_auth.currentUser?.email != null) {
      return Result.error(false);
    }

    try {
      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      await _auth.currentUser!.linkWithCredential(credential);

      return Result.value(true);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  /// パスワードを忘れた場合のリセットメール送信
  Future<Result<bool>> sendPasswordResetEmail(String email) async {
    if (email.isEmpty) {
      return Result.error(false);
    }

    try {
      await _auth.sendPasswordResetEmail(email: email);
      return Result.value(true);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
