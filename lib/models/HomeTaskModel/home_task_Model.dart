// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class TaskModel {
  String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final DateTime dueDateTime;
  final DateTime updateAt;
  final DateTime createdAt;
  final int iconCodePoint;
  final String iconFontFamily;
  final int iconColorA;
  final int iconColorB;
  final int iconColorG;
  final int iconColorR;
  final int priorityLevel;
  final String categoryName;
  final TaskStatus status;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.dueDateTime,
    required this.updateAt,
    required this.createdAt,
    required this.iconCodePoint,
    required this.iconFontFamily,
    required this.iconColorA,
    required this.iconColorB,
    required this.iconColorG,
    required this.iconColorR,
    required this.priorityLevel,
    required this.categoryName,
    required this.status,
  });

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? dueDate,
    DateTime? dueDateTime,
    DateTime? updateAt,
    DateTime? createdAt,
    int? iconCodePoint,
    String? iconFontFamily,
    int? iconColorA,
    int? iconColorB,
    int? iconColorG,
    int? iconColorR,
    int? priorityLevel,
    String? categoryName,
    TaskStatus? status,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      dueDateTime: dueDateTime ?? this.dueDateTime,
      updateAt: updateAt ?? this.updateAt,
      createdAt: createdAt ?? this.createdAt,
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
      iconFontFamily: iconFontFamily ?? this.iconFontFamily,
      iconColorA: iconColorA ?? this.iconColorA,
      iconColorB: iconColorB ?? this.iconColorB,
      iconColorG: iconColorG ?? this.iconColorG,
      iconColorR: iconColorR ?? this.iconColorR,
      priorityLevel: priorityLevel ?? this.priorityLevel,
      categoryName: categoryName ?? this.categoryName,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate.millisecondsSinceEpoch,
      'dueDateTime': dueDateTime.millisecondsSinceEpoch,
      'updateAt': updateAt.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'iconCodePoint': iconCodePoint,
      'iconFontFamily': iconFontFamily,
      'iconColorA': iconColorA,
      'iconColorB': iconColorB,
      'iconColorG': iconColorG,
      'iconColorR': iconColorR,
      'priorityLevel': priorityLevel,
      'categoryName': categoryName,
      'status': fromTaskStatus(status),
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      dueDate: DateTime.fromMillisecondsSinceEpoch(map['dueDate'] as int),
      dueDateTime:
          DateTime.fromMillisecondsSinceEpoch(map['dueDateTime'] as int),
      updateAt: DateTime.fromMillisecondsSinceEpoch(map['updateAt'] as int),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      iconCodePoint: map['iconCodePoint'] as int,
      iconFontFamily: map['iconFontFamily'] as String,
      iconColorA: map['iconColorA'] as int,
      iconColorB: map['iconColorB'] as int,
      iconColorG: map['iconColorG'] as int,
      iconColorR: map['iconColorR'] as int,
      priorityLevel: map['priorityLevel'] as int,
      categoryName: map['categoryName'] as String,
      status: toTaskStatus(map['status']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, description: $description, dueDate: $dueDate, dueDateTime: $dueDateTime, updateAt: $updateAt, createdAt: $createdAt, iconCodePoint: $iconCodePoint, iconFontFamily: $iconFontFamily, iconColorA: $iconColorA, iconColorB: $iconColorB, iconColorG: $iconColorG, iconColorR: $iconColorR, priorityLevel: $priorityLevel, categoryName: $categoryName, status: $status)';
  }

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.dueDate == dueDate &&
        other.dueDateTime == dueDateTime &&
        other.updateAt == updateAt &&
        other.createdAt == createdAt &&
        other.iconCodePoint == iconCodePoint &&
        other.iconFontFamily == iconFontFamily &&
        other.iconColorA == iconColorA &&
        other.iconColorB == iconColorB &&
        other.iconColorG == iconColorG &&
        other.iconColorR == iconColorR &&
        other.priorityLevel == priorityLevel &&
        other.categoryName == categoryName &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        dueDate.hashCode ^
        dueDateTime.hashCode ^
        updateAt.hashCode ^
        createdAt.hashCode ^
        iconCodePoint.hashCode ^
        iconFontFamily.hashCode ^
        iconColorA.hashCode ^
        iconColorB.hashCode ^
        iconColorG.hashCode ^
        iconColorR.hashCode ^
        priorityLevel.hashCode ^
        categoryName.hashCode ^
        status.hashCode;
  }
}

enum TaskStatus {
  completed,
  inprogress,
}

String fromTaskStatus(TaskStatus staus) {
  switch (staus) {
    case TaskStatus.completed:
      return "Completed";
    case TaskStatus.inprogress:
      return "In Progress";
  }
}

TaskStatus toTaskStatus(String status) {
  switch (status) {
    case "Completed":
      return TaskStatus.completed;
    case "In Progress":
      return TaskStatus.inprogress;
    default:
      return TaskStatus.inprogress;
  }
}



// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:flutter/material.dart';

// class TaskModel {
//   String id;
//   final String title;
//   final String description;
//   final DateTime dueDate;
//   final String dueTime;
//   final DateTime updateAt;
//   final DateTime createdAt;
//   final int iconCodePoint;
//   final String iconFontFamily;
//   final int iconColorA;
//   final int iconColorB;
//   final int iconColorG;
//   final int iconColorR;
//   final int priorityLevel;
//   final String categoryName;
//   final TaskStatus status;
//   TaskModel({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.dueDate,
//     required this.dueTime,
//     required this.updateAt,
//     required this.createdAt,
//     required this.iconCodePoint,
//     required this.iconFontFamily,
//     required this.iconColorA,
//     required this.iconColorB,
//     required this.iconColorG,
//     required this.iconColorR,
//     required this.priorityLevel,
//     required this.categoryName,
//     required this.status,
//   });

//   TaskModel copyWith({
//     String? id,
//     String? title,
//     String? description,
//     DateTime? dueDate,
//     String? dueTime,
//     DateTime? updateAt,
//     DateTime? createdAt,
//     int? iconCodePoint,
//     String? iconFontFamily,
//     int? iconColorA,
//     int? iconColorB,
//     int? iconColorG,
//     int? iconColorR,
//     int? priorityLevel,
//     String? categoryName,
//     TaskStatus? status,
//   }) {
//     return TaskModel(
//       id: id ?? this.id,
//       title: title ?? this.title,
//       description: description ?? this.description,
//       dueDate: dueDate ?? this.dueDate,
//       dueTime: dueTime ?? this.dueTime,
//       updateAt: updateAt ?? this.updateAt,
//       createdAt: createdAt ?? this.createdAt,
//       iconCodePoint: iconCodePoint ?? this.iconCodePoint,
//       iconFontFamily: iconFontFamily ?? this.iconFontFamily,
//       iconColorA: iconColorA ?? this.iconColorA,
//       iconColorB: iconColorB ?? this.iconColorB,
//       iconColorG: iconColorG ?? this.iconColorG,
//       iconColorR: iconColorR ?? this.iconColorR,
//       priorityLevel: priorityLevel ?? this.priorityLevel,
//       categoryName: categoryName ?? this.categoryName,
//       status: status ?? this.status,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     var newDate = DateTime(dueDate.year, dueDate.month, dueDate.day);
//     var newTime = DateTime(dueDate.hour, dueDate.minute);

//     return <String, dynamic>{
//       'id': id,
//       'title': title,
//       'description': description,
//       'dueDate': newDate.millisecondsSinceEpoch,
//       'dueTime': newTime.toString(),
//       'updateAt': updateAt.millisecondsSinceEpoch,
//       'createdAt': createdAt.millisecondsSinceEpoch,
//       'iconCodePoint': iconCodePoint,
//       'iconFontFamily': iconFontFamily,
//       'iconColorA': iconColorA,
//       'iconColorB': iconColorB,
//       'iconColorG': iconColorG,
//       'iconColorR': iconColorR,
//       'priorityLevel': priorityLevel,
//       'categoryName': categoryName,
//       'status': fromTaskStatus(status),
//     };
//   }

//   factory TaskModel.fromMap(Map<String, dynamic> map) {
//     return TaskModel(
//       id: map['id'] as String,
//       title: map['title'] as String,
//       description: map['description'] as String,
//       dueDate: DateTime.fromMillisecondsSinceEpoch(map['dueDate'] as int),
//       dueTime: map['dueTime'] ?? '12:00 Pm',
//       updateAt: DateTime.fromMillisecondsSinceEpoch(map['updateAt'] as int),
//       createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
//       iconCodePoint: map['iconCodePoint'] as int,
//       iconFontFamily: map['iconFontFamily'] as String,
//       iconColorA: map['iconColorA'] as int,
//       iconColorB: map['iconColorB'] as int,
//       iconColorG: map['iconColorG'] as int,
//       iconColorR: map['iconColorR'] as int,
//       priorityLevel: map['priorityLevel'] as int,
//       categoryName: map['categoryName'] as String,
//       status: map['status'] == null
//           ? toTaskStatus('In Progress')
//           : toTaskStatus('Completed'),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory TaskModel.fromJson(String source) =>
//       TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'TaskModel(id: $id, title: $title, description: $description, dueDate: $dueDate, dueTime: $dueTime, updateAt: $updateAt, createdAt: $createdAt, iconCodePoint: $iconCodePoint, iconFontFamily: $iconFontFamily, iconColorA: $iconColorA, iconColorB: $iconColorB, iconColorG: $iconColorG, iconColorR: $iconColorR, priorityLevel: $priorityLevel, categoryName: $categoryName, status: $status)';
//   }

//   @override
//   bool operator ==(covariant TaskModel other) {
//     if (identical(this, other)) return true;

//     return other.id == id &&
//         other.title == title &&
//         other.description == description &&
//         other.dueDate == dueDate &&
//         other.dueTime == dueTime &&
//         other.updateAt == updateAt &&
//         other.createdAt == createdAt &&
//         other.iconCodePoint == iconCodePoint &&
//         other.iconFontFamily == iconFontFamily &&
//         other.iconColorA == iconColorA &&
//         other.iconColorB == iconColorB &&
//         other.iconColorG == iconColorG &&
//         other.iconColorR == iconColorR &&
//         other.priorityLevel == priorityLevel &&
//         other.categoryName == categoryName &&
//         other.status == status;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         title.hashCode ^
//         description.hashCode ^
//         dueDate.hashCode ^
//         dueTime.hashCode ^
//         updateAt.hashCode ^
//         createdAt.hashCode ^
//         iconCodePoint.hashCode ^
//         iconFontFamily.hashCode ^
//         iconColorA.hashCode ^
//         iconColorB.hashCode ^
//         iconColorG.hashCode ^
//         iconColorR.hashCode ^
//         priorityLevel.hashCode ^
//         categoryName.hashCode ^
//         status.hashCode;
//   }
// }

// enum TaskStatus {
//   completed,
//   inprogress,
// }

// String fromTaskStatus(TaskStatus staus) {
//   switch (staus) {
//     case TaskStatus.completed:
//       return "Completed";
//     case TaskStatus.inprogress:
//       return "In Progress";
//   }
// }

// TaskStatus toTaskStatus(String status) {
//   switch (status) {
//     case "Completed":
//       return TaskStatus.completed;
//     case "In Progress":
//       return TaskStatus.inprogress;
//     default:
//       return TaskStatus.inprogress;
//   }
// }
