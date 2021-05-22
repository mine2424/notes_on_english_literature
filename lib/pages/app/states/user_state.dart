import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notes_on_english_literature/common/types/status.dart';

@immutable
class UserState {
  //enum
  final AuthStatus authStatus;

  UserState({
    this.authStatus = AuthStatus.none,
  });

  UserState copyWith({
    AuthStatus? authStatus,
  }) {
    return UserState(
      authStatus: authStatus ?? this.authStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'authStatus': authStatus.index,
    };
  }

  factory UserState.fromMap(Map<String, dynamic> map) {
    return UserState(
      authStatus: AuthStatus.values[map['authStatus'] as int],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserState.fromJson(String source) =>
      UserState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserState(authStatus: $authStatus)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is UserState && other.authStatus == authStatus;
  }

  @override
  int get hashCode => authStatus.hashCode;
}
