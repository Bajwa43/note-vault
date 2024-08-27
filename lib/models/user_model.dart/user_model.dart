import 'dart:convert';

class UserModel {
  String userName;
  String imagePath;
  UserModel({
    required this.userName,
    required this.imagePath,
  });

  UserModel copyWith({
    String? userName,
    String? imagePath,
  }) {
    return UserModel(
      userName: userName ?? this.userName,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'imagePath': imagePath,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['userName'] as String,
      imagePath: map['imagePath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(userName: $userName, imagePath: $imagePath)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.userName == userName && other.imagePath == imagePath;
  }

  @override
  int get hashCode => userName.hashCode ^ imagePath.hashCode;
}
