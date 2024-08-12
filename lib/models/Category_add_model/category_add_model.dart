// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';

class CategoryAddModel {
  final int iconCodePoint;
  final String iconFontFamily;
  final int iconColorA;
  final int iconColorB;
  final int iconColorG;
  final int iconColorR;
  final String categoryName;
  CategoryAddModel({
    required this.iconCodePoint,
    required this.iconFontFamily,
    required this.iconColorA,
    required this.iconColorB,
    required this.iconColorG,
    required this.iconColorR,
    required this.categoryName,
  });

  CategoryAddModel copyWith({
    int? iconCodePoint,
    String? iconFontFamily,
    int? iconColorA,
    int? iconColorB,
    int? iconColorG,
    int? iconColorR,
    String? categoryName,
  }) {
    return CategoryAddModel(
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
      iconFontFamily: iconFontFamily ?? this.iconFontFamily,
      iconColorA: iconColorA ?? this.iconColorA,
      iconColorB: iconColorB ?? this.iconColorB,
      iconColorG: iconColorG ?? this.iconColorG,
      iconColorR: iconColorR ?? this.iconColorR,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iconCodePoint': iconCodePoint,
      'iconFontFamily': iconFontFamily,
      'iconColorA': iconColorA,
      'iconColorB': iconColorB,
      'iconColorG': iconColorG,
      'iconColorR': iconColorR,
      'categoryName': categoryName,
    };
  }

  factory CategoryAddModel.fromMap(Map<String, dynamic> map) {
    return CategoryAddModel(
      iconCodePoint: map['iconCodePoint'] as int,
      iconFontFamily: map['iconFontFamily'] as String,
      iconColorA: map['iconColorA'] as int,
      iconColorB: map['iconColorB'] as int,
      iconColorG: map['iconColorG'] as int,
      iconColorR: map['iconColorR'] as int,
      categoryName: map['categoryName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryAddModel.fromJson(String source) =>
      CategoryAddModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoryAddModel(iconCodePoint: $iconCodePoint, iconFontFamily: $iconFontFamily, iconColorA: $iconColorA, iconColorB: $iconColorB, iconColorG: $iconColorG, iconColorR: $iconColorR, categoryName: $categoryName)';
  }

  @override
  bool operator ==(covariant CategoryAddModel other) {
    if (identical(this, other)) return true;

    return other.iconCodePoint == iconCodePoint &&
        other.iconFontFamily == iconFontFamily &&
        other.iconColorA == iconColorA &&
        other.iconColorB == iconColorB &&
        other.iconColorG == iconColorG &&
        other.iconColorR == iconColorR &&
        other.categoryName == categoryName;
  }

  @override
  int get hashCode {
    return iconCodePoint.hashCode ^
        iconFontFamily.hashCode ^
        iconColorA.hashCode ^
        iconColorB.hashCode ^
        iconColorG.hashCode ^
        iconColorR.hashCode ^
        categoryName.hashCode;
  }
}
