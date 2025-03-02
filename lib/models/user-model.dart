import 'dart:convert';

import 'package:flutter/material.dart';

// User model
@immutable
class User {
  final String id;
  final String name;
  final int age;
  final String email;
  const User({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
  });

  User copyWith({String? id, String? name, int? age, String? email}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'age': age, 'email': email};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, age: $age, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.age == age &&
        other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ age.hashCode ^ email.hashCode;
  }
}
