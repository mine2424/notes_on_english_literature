import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:notes_on_english_literature/domain/notes/models/note.dart';

class NoteList {
  final List<Note> noteList;
  final String imagePath;

  NoteList({
    this.noteList = const <Note>[],
    this.imagePath = '',
  });

  NoteList copyWith({
    List<Note>? noteList,
    String? imagePath,
  }) {
    return NoteList(
      noteList: noteList ?? this.noteList,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'noteList': noteList.map((x) => x.toMap()).toList(),
    };
  }

  factory NoteList.fromMap(Map<String, dynamic> map) {
    return NoteList(
      noteList: List<Note>.from(map['noteList']
              ?.map((Map<String, dynamic> x) => Note.fromMap(x)) as List<Note>)
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteList.fromJson(String source) =>
      NoteList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is NoteList && listEquals(other.noteList, noteList);
  }

  @override
  int get hashCode => noteList.hashCode;
}
