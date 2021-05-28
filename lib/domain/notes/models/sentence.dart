import 'dart:convert';

import 'package:objectbox/objectbox.dart';

import 'package:notes_on_english_literature/domain/user/models/user.dart';

@Entity()
class Sentence {
  String naturalSentence;
  String structedSentence;
  String transration;
  String grammerMemo;
  User author;
  int watchCount;

  int id;

  Sentence({
    this.naturalSentence = '',
    this.structedSentence = '',
    this.transration = '',
    this.grammerMemo = '',
    this.author = const User(),
    this.watchCount = 0,
    this.id = 0,
  });

  Sentence copyWith({
    String? naturalSentence,
    String? structedSentence,
    String? transration,
    String? grammerMemo,
    User? author,
    DateTime? updateAt,
    int? watchCount,
    int? id,
  }) {
    return Sentence(
      naturalSentence: naturalSentence ?? this.naturalSentence,
      structedSentence: structedSentence ?? this.structedSentence,
      transration: transration ?? this.transration,
      grammerMemo: grammerMemo ?? this.grammerMemo,
      author: author ?? this.author,
      watchCount: watchCount ?? this.watchCount,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'naturalSentence': naturalSentence,
      'structedSentence': structedSentence,
      'transration': transration,
      'grammerMemo': grammerMemo,
      'author': author.toMap(),
      'watchCount': watchCount,
      'id': id,
    };
  }

  factory Sentence.fromMap(Map<String, dynamic> map) {
    return Sentence(
      naturalSentence: map['naturalSentence'] as String,
      structedSentence: map['structedSentence'] as String,
      transration: map['transration'] as String,
      grammerMemo: map['grammerMemo'] as String,
      author: User.fromMap(map['author'] as Map<String, dynamic>),
      watchCount: map['watchCount'] as int,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sentence.fromJson(String source) =>
      Sentence.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Sentence(naturalSentence: $naturalSentence, structedSentence: $structedSentence, transration: $transration, grammerMemo: $grammerMemo, author: $author, watchCount: $watchCount, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is Sentence &&
        other.naturalSentence == naturalSentence &&
        other.structedSentence == structedSentence &&
        other.transration == transration &&
        other.grammerMemo == grammerMemo &&
        other.author == author &&
        other.watchCount == watchCount &&
        other.id == id;
  }

  @override
  int get hashCode {
    return naturalSentence.hashCode ^
        structedSentence.hashCode ^
        transration.hashCode ^
        grammerMemo.hashCode ^
        author.hashCode ^
        watchCount.hashCode ^
        id.hashCode;
  }
}
