import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:objectbox/objectbox.dart';

import 'package:notes_on_english_literature/domain/notes/models/sentence.dart';

@Entity()
class Note {
  String title;
  String noteId;
  String uid;
  String imageUrl;
  List<Sentence> sentenceList;

  Note({
    this.title = '',
    this.noteId = '',
    this.uid = '',
    this.imageUrl = '',
    this.sentenceList = const <Sentence>[],
  });

  Note copyWith({
    String? title,
    String? noteId,
    String? uid,
    String? imageUrl,
    List<Sentence>? sentenceList,
  }) {
    return Note(
      title: title ?? this.title,
      noteId: noteId ?? this.noteId,
      uid: uid ?? this.uid,
      imageUrl: imageUrl ?? this.imageUrl,
      sentenceList: sentenceList ?? this.sentenceList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'noteId': noteId,
      'uid': uid,
      'imageUrl': imageUrl,
      'sentenceList': sentenceList.map((x) => x.toMap()).toList(),
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'] as String,
      noteId: map['noteId'] as String,
      uid: map['uid'] as String,
      imageUrl: map['imageUrl'] as String,
      sentenceList: List<Sentence>.from(map['sentenceList']?.map(
        (Map<String, dynamic> x) => Sentence.fromMap(x),
      ) as List<Sentence>)
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() {
    return 'Note(title: $title, noteId: $noteId, uid: $uid, imageUrl: $imageUrl, sentenceList: $sentenceList)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is Note &&
        other.title == title &&
        other.noteId == noteId &&
        other.uid == uid &&
        other.imageUrl == imageUrl &&
        listEquals(other.sentenceList, sentenceList);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        noteId.hashCode ^
        uid.hashCode ^
        imageUrl.hashCode ^
        sentenceList.hashCode;
  }
}
