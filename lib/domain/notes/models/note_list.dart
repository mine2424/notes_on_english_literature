import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:objectbox/objectbox.dart';

import 'package:notes_on_english_literature/domain/notes/models/note.dart';

@Entity()
class NoteList {
  List<Note> noteList;
  int id;

  NoteList({
    this.noteList = const <Note>[],
    this.id = 0,
  });

  NoteList copyWith({
    List<Note>? noteList,
    int? id,
  }) {
    return NoteList(
      noteList: noteList ?? this.noteList,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'noteList': noteList.map((x) => x.toMap()).toList(),
      'id': id,
    };
  }

  factory NoteList.fromMap(Map<String, dynamic> map) {
    return NoteList(
      noteList: List<Note>.from((map['noteList'] as List<Map<String, dynamic>>)
          .map((x) => Note.fromMap(x))
          .toList()),
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteList.fromJson(String source) =>
      NoteList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NoteList(noteList: $noteList, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is NoteList &&
        listEquals(other.noteList, noteList) &&
        other.id == id;
  }

  @override
  int get hashCode => noteList.hashCode ^ id.hashCode;
}
