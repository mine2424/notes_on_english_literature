import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:async/async.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes_on_english_literature/common/types/status.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class UserService {
  final _auth = FirebaseAuth.instance;

  String get currentUid => _auth.currentUser!.uid;

  Future<AuthStatus> listenAuthStatus() async {
    final currentUser = _auth.currentUser;

    try {
      if (currentUser?.uid == null) {
        return AuthStatus.none;
      } else if (currentUser!.emailVerified) {
        return AuthStatus.email;
      } else {
        return AuthStatus.authenticated;
      }
    } on Exception catch (e) {
      print(e);
      return AuthStatus.error;
    }
  }

  Future<Result<UserCredential>> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Result.value(result);
    } on FirebaseAuthException catch (e) {
      return Result.error(e.code);
    } on Exception catch (e) {
      print(e);
      return Result.error(e);
    }
  }

  Future<Result<UserCredential>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Result.value(result);
    } on Exception catch (e) {
      print(e);
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

  Future<Result<UserCredential>> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final googleUser = await GoogleSignIn(scopes: ['email']).signIn();

      // Obtain the auth details from the request
      final googleAuth = await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      final userCrecidential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return Result.value(userCrecidential);
    } on Exception catch (e) {
      print(e);
      return Result.error(e);
      // TODO: Handle error
    }
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<Result<UserCredential>> signInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      final userCrecidential =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      return Result.value(userCrecidential);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on Exception catch (e) {
      print(e);
    }
  }
}
