import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class AppState {
  const AppState({
    this.themeMode = ThemeMode.dark,
    this.isLoading = false,
  });

  /// field

  //enum
  final ThemeMode themeMode;
  final bool isLoading;

  ///

  AppState copyWith({
    ThemeMode? themeMode,
    bool? isLoading,
  }) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'themeMode': themeMode.index,
      'isLoading': isLoading,
    };
  }

  factory AppState.fromMap(Map<String, dynamic> map) {
    return AppState(
      themeMode: ThemeMode.values[map['themeMode'] as int],
      isLoading: map['isLoading'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppState.fromJson(String source) =>
      AppState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AppState(themeMode: $themeMode, isLoading: $isLoading)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is AppState &&
        other.themeMode == themeMode &&
        other.isLoading == isLoading;
  }

  @override
  int get hashCode => themeMode.hashCode ^ isLoading.hashCode;
}
