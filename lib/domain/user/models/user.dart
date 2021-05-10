import 'dart:convert';

class User {
  /// field

  final String uid;
  final String name;

  ///

  User({
    required this.uid,
    required this.name,
  });

  User copyWith({
    String? uid,
    String? name,
  }) {
    return User(
      uid: uid ?? this.uid,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(uid: $uid, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.uid == uid && other.name == name;
  }

  @override
  int get hashCode => uid.hashCode ^ name.hashCode;
}
