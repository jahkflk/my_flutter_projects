import '../models/user_model.dart';

/// dtos/user_dto.dart
class UserDto {
  final String name;
  final String email;
  final String password;

  UserDto({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
      };

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        password: json['password'] ?? '',
      );

  /// 转换为数据库使用的 UserModel
  UserModel toModel() => UserModel(
        name: name,
        email: email,
        password: password,
      );
}
