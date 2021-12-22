import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:notes_on_english_literature/domain/notes/models/note.dart';

class NoteListState {
  final List<Note> noteList;
  final String imageUrl;
  final String title;
  final String uid;
  final String noteId;

  NoteListState({
    this.noteList = const <Note>[],
    this.imageUrl = '',
    this.noteId = '',
    this.title = '',
    this.uid = '',
  });

  NoteListState copyWith({
    List<Note>? noteList,
    String? imageUrl,
    String? title,
    String? uid,
    String? noteId,
  }) {
    return NoteListState(
      noteList: noteList ?? this.noteList,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      uid: uid ?? this.uid,
      noteId: noteId ?? this.noteId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'noteList': noteList.map((x) => x.toMap()).toList(),
    };
  }

  factory NoteListState.fromMap(Map<String, dynamic> map) {
    return NoteListState(
      noteList: List<Note>.from(map['noteList']
              ?.map((Map<String, dynamic> x) => Note.fromMap(x)) as List<Note>)
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteListState.fromJson(String source) =>
      NoteListState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is NoteListState && listEquals(other.noteList, noteList);
  }

  @override
  int get hashCode => noteList.hashCode;
}
