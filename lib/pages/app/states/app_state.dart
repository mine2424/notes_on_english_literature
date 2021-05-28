import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
@immutable
class AppState {
  /// field

  //enum
  ThemeMode themeMode;
  bool isLoading;

  int id;

  AppState({
    this.themeMode = ThemeMode.dark,
    this.isLoading = false,
    this.id = 0,
  });

  AppState copyWith({
    ThemeMode? themeMode,
    bool? isLoading,
    int? id,
  }) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
      isLoading: isLoading ?? this.isLoading,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'themeMode': themeMode.index,
      'isLoading': isLoading,
      'id': id,
    };
  }

  factory AppState.fromMap(Map<String, dynamic> map) {
    return AppState(
      themeMode: ThemeMode.values[map['themeMode'] as int],
      isLoading: map['isLoading'] as bool,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppState.fromJson(String source) =>
      AppState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AppState(themeMode: $themeMode, isLoading: $isLoading, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is AppState &&
        other.themeMode == themeMode &&
        other.isLoading == isLoading &&
        other.id == id;
  }

  @override
  int get hashCode => themeMode.hashCode ^ isLoading.hashCode ^ id.hashCode;
}
