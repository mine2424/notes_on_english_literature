import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:objectbox/objectbox.dart';

import 'package:notes_on_english_literature/domain/notes/models/sentence.dart';

@Entity()
class Note {
  String title;
  String imageUrl = '';
  List<Sentence> sentenceList;

  int id;

  Note({
    this.title = '',
    this.imageUrl = '',
    this.sentenceList = const <Sentence>[],
    this.id = 0,
  });

  Note copyWith({
    String? title,
    String? imageUrl,
    List<Sentence>? sentenceList,
    int? id,
  }) {
    return Note(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      sentenceList: sentenceList ?? this.sentenceList,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imageUrl': imageUrl,
      'sentenceList': sentenceList.map((x) => x.toMap()).toList(),
      'id': id,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
      sentenceList: List<Sentence>.from(
          (map['sentenceList'] as List<Map<String, dynamic>>)
              .map((x) => Sentence.fromMap(x))
              .toList()),
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Note(title: $title, imageUrl: $imageUrl, sentenceList: $sentenceList, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is Note &&
        other.title == title &&
        other.imageUrl == imageUrl &&
        listEquals(other.sentenceList, sentenceList) &&
        other.id == id;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        imageUrl.hashCode ^
        sentenceList.hashCode ^
        id.hashCode;
  }
}
