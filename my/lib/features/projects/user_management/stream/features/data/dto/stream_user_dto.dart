import '../models/stream_user_model.dart';

/// dtos/user_dto_stream.dart
class UserDtoStream {
  final String name;
  final String email;
  final String password;

  UserDtoStream({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
      };

  factory UserDtoStream.fromJson(Map<String, dynamic> json) => UserDtoStream(
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        password: json['password'] ?? '',
      );

  /// 转换为数据库使用的 UserModelStream
  UserModelStream toModel() => UserModelStream(
        name: name,
        email: email,
        password: password,
      );
}
