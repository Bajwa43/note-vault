// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class HomeTaskModel {
  final String title;
  final String description;
  final DateTime dueDate;
  final DateTime updateAt;
  final DateTime createdAt;
  final int iconCodePoint;
  final String iconFontFamily;
  final int iconColorA;
  final int iconColorB;
  final int iconColorG;
  final int iconColorR;
  final int priorityLevel;
  HomeTaskModel({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.updateAt,
    required this.createdAt,
    required this.iconCodePoint,
    required this.iconFontFamily,
    required this.iconColorA,
    required this.iconColorB,
    required this.iconColorG,
    required this.iconColorR,
    required this.priorityLevel,
  });

  HomeTaskModel copyWith({
    String? title,
    String? description,
    DateTime? dueDate,
    DateTime? updateAt,
    DateTime? createdAt,
    int? iconCodePoint,
    String? iconFontFamily,
    int? iconColorA,
    int? iconColorB,
    int? iconColorG,
    int? iconColorR,
    int? priorityLevel,
  }) {
    return HomeTaskModel(
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      updateAt: updateAt ?? this.updateAt,
      createdAt: createdAt ?? this.createdAt,
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
      iconFontFamily: iconFontFamily ?? this.iconFontFamily,
      iconColorA: iconColorA ?? this.iconColorA,
      iconColorB: iconColorB ?? this.iconColorB,
      iconColorG: iconColorG ?? this.iconColorG,
      iconColorR: iconColorR ?? this.iconColorR,
      priorityLevel: priorityLevel ?? this.priorityLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'dueDate': dueDate.millisecondsSinceEpoch,
      'updateAt': updateAt.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'iconCodePoint': iconCodePoint,
      'iconFontFamily': iconFontFamily,
      'iconColorA': iconColorA,
      'iconColorB': iconColorB,
      'iconColorG': iconColorG,
      'iconColorR': iconColorR,
      'priorityLevel': priorityLevel,
    };
  }

  factory HomeTaskModel.fromMap(Map<String, dynamic> map) {
    return HomeTaskModel(
      title: map['title'] as String,
      description: map['description'] as String,
      dueDate: DateTime.fromMillisecondsSinceEpoch(map['dueDate'] as int),
      updateAt: DateTime.fromMillisecondsSinceEpoch(map['updateAt'] as int),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      iconCodePoint: map['iconCodePoint'] as int,
      iconFontFamily: map['iconFontFamily'] as String,
      iconColorA: map['iconColorA'] as int,
      iconColorB: map['iconColorB'] as int,
      iconColorG: map['iconColorG'] as int,
      iconColorR: map['iconColorR'] as int,
      priorityLevel: map['priorityLevel'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeTaskModel.fromJson(String source) =>
      HomeTaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HomeTaskModel(title: $title, description: $description, dueDate: $dueDate, updateAt: $updateAt, createdAt: $createdAt, iconCodePoint: $iconCodePoint, iconFontFamily: $iconFontFamily, iconColorA: $iconColorA, iconColorB: $iconColorB, iconColorG: $iconColorG, iconColorR: $iconColorR, priorityLevel: $priorityLevel)';
  }

  @override
  bool operator ==(covariant HomeTaskModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.dueDate == dueDate &&
        other.updateAt == updateAt &&
        other.createdAt == createdAt &&
        other.iconCodePoint == iconCodePoint &&
        other.iconFontFamily == iconFontFamily &&
        other.iconColorA == iconColorA &&
        other.iconColorB == iconColorB &&
        other.iconColorG == iconColorG &&
        other.iconColorR == iconColorR &&
        other.priorityLevel == priorityLevel;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        dueDate.hashCode ^
        updateAt.hashCode ^
        createdAt.hashCode ^
        iconCodePoint.hashCode ^
        iconFontFamily.hashCode ^
        iconColorA.hashCode ^
        iconColorB.hashCode ^
        iconColorG.hashCode ^
        iconColorR.hashCode ^
        priorityLevel.hashCode;
  }
}
