import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:notes_on_english_literature/domain/notes/models/sentence.dart';

@immutable
class Note {
  final String title;
  final String noteId;
  final String uid;
  final String imageUrl;
  final String parentNoteId;
  final bool isOrigin;
  final DateTime? createAt = DateTime.now();
  final List<Sentence> sentenceList;

  Note({
    this.title = '',
    this.noteId = '',
    this.uid = '',
    this.imageUrl = '',
    this.parentNoteId = '',
    this.isOrigin = true,
    this.sentenceList = const <Sentence>[],
  });

  Note copyWith({
    String? title,
    String? noteId,
    String? uid,
    String? imageUrl,
    String? parentNoteId,
    bool? isOrigin,
    List<Sentence>? sentenceList,
  }) {
    return Note(
      title: title ?? this.title,
      noteId: noteId ?? this.noteId,
      uid: uid ?? this.uid,
      imageUrl: imageUrl ?? this.imageUrl,
      parentNoteId: parentNoteId ?? this.parentNoteId,
      isOrigin: isOrigin ?? this.isOrigin,
      sentenceList: sentenceList ?? this.sentenceList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'noteId': noteId,
      'uid': uid,
      'imageUrl': imageUrl,
      'parentNoteId': parentNoteId,
      'isOrigin': isOrigin,
      'sentenceList': sentenceList.map((x) => x.toMap()).toList(),
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    final sentenceList = map['sentenceList'] as List<dynamic>;
    return Note(
      title: map['title'].toString(),
      noteId: map['noteId'].toString(),
      uid: map['uid'].toString(),
      imageUrl: map['imageUrl'].toString(),
      parentNoteId: map['parentNoteId'].toString(),
      isOrigin: map['isOrigin'] as bool,
      sentenceList: List<Sentence>.from(
        sentenceList.map<Sentence>(
          (e) => Sentence.fromMap(e as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

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
