import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:notes_on_english_literature/common/types/status.dart';
import 'package:notes_on_english_literature/domain/user/models/user.dart';

@immutable
class UserState {
  //enum
  final AuthStatus authStatus;
  final User user;

  const UserState({
    this.authStatus = AuthStatus.waiting,
    this.user = const User(),
  });

  UserState copyWith({
    AuthStatus? authStatus,
    User? user,
  }) {
    return UserState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'authStatus': authStatus.index,
      'user': user.toMap(),
    };
  }

  factory UserState.fromMap(Map<String, dynamic> map) {
    return UserState(
      authStatus: AuthStatus.values[map['authStatus'] as int],
      user: User.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserState.fromJson(String source) =>
      UserState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserState(authStatus: $authStatus, user: $user)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is UserState &&
        other.authStatus == authStatus &&
        other.user == user;
  }

  @override
  int get hashCode => authStatus.hashCode ^ user.hashCode;
}

//   const UserState({
//     this.authStatus = AuthStatus.waiting,
//   });
// 
//   UserState copyWith({
//     AuthStatus? authStatus,
//   }) {
//     return UserState(
//       authStatus: authStatus ?? this.authStatus,
//     );
//   }
// 
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'authStatus': authStatus.index,
//     };
//   }
// 
//   factory UserState.fromMap(Map<String, dynamic> map) {
//     return UserState(
//       authStatus: AuthStatus.values[map['authStatus'] as int],
//     );
//   }
// 
//   String toJson() => json.encode(toMap());
// 
//   factory UserState.fromJson(String source) =>
//       UserState.fromMap(json.decode(source) as Map<String, dynamic>);
// 
//   @override
//   String toString() => 'UserState(authStatus: $authStatus)';
// 
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) {
//       return true;
//     }
// 
//     return other is UserState && other.authStatus == authStatus;
//   }
// 
//   @override
//   int get hashCode => authStatus.hashCode;

