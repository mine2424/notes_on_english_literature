import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:notes_on_english_literature/domain/user/models/user.dart';

class UserRepository {
  final _db = FirebaseFirestore.instance;

  Future<Result<void>> addUser(User user) async {
    final doc = _db.doc('private/users/user_v1/${user.uid}/writeOnly/v1');

    try {
      doc.set(user.toMap(), SetOptions(merge: true));
    } on Exception catch (e) {
      return Result.error(e);
    }

    return Result.value('added');
  }

  Future<Result<User>> fetchUser(User user) async {
    late DocumentSnapshot snapshot;
    final doc = _db.doc('private/users/user_v1/${user.uid}/readOnly/v1');

    try {
      snapshot = await doc.get();
    } on Exception catch (e) {
      return Result.error(e);
    }

    return Result.value(User.fromJson(snapshot as String));
  }

  Future<Result<void>> deleteUser(String uid) async {
    final doc = _db.doc('private/users/user_v1/$uid/');

    try {
      await doc.delete();
    } on Exception catch (e) {
      return Result.error(e);
    }

    return Result.value('deleted');
  }

  // TODO: ユーザー編集（ユーザー情報）（課金ユーザー）（ログイン状態email,apple...）
  Future<Result<void>> editUser(User user) async {
    final doc = _db.doc('private/users/user_v1/${user.uid}/');

    try {
      doc.set(user.toMap(), SetOptions(merge: true));
    } on Exception catch (e) {
      return Result.error(e);
    }

    return Result.value('edited');
  }
}
