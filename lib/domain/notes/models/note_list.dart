import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:objectbox/objectbox.dart';

import 'package:notes_on_english_literature/domain/notes/models/note.dart';

@Entity()
class NoteList {
  List<Note> noteList;
  String imagePath;
  int id;

  NoteList({
    this.noteList = const <Note>[],
    this.imagePath = '',
    this.id = 0,
  });

  NoteList copyWith({
    List<Note>? noteList,
    String? imagePath,
    int? id,
  }) {
    return NoteList(
      noteList: noteList ?? this.noteList,
      imagePath: imagePath ?? this.imagePath,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'noteList': noteList.map((x) => x.toMap()).toList(),
      'imagePath': imagePath,
      'id': id,
    };
  }

  factory NoteList.fromMap(Map<String, dynamic> map) {
    return NoteList(
      noteList: List<Note>.from((map['noteList'] as List<Map<String, dynamic>>)
          .map((x) => Note.fromMap(x))
          .toList()),
      imagePath: map['imagePath'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteList.fromJson(String source) =>
      NoteList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'NoteList(noteList: $noteList, imagePath: $imagePath, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is NoteList &&
        listEquals(other.noteList, noteList) &&
        other.imagePath == imagePath &&
        other.id == id;
  }

  @override
  int get hashCode => noteList.hashCode ^ imagePath.hashCode ^ id.hashCode;
}
