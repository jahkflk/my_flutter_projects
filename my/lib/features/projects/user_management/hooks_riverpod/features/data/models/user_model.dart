/// models/device_model.dart
class UserModel {
  final int? id;
  final String? name;
  final String email;
  final String password;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserModel({
    this.id,
    this.name,
    required this.email,
    required this.password,
    this.createdAt,
    this.updatedAt,
  });

  /// 用于数据库插入、更新的 map
  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'name': name ?? '',
      'email': email,
      'password': password,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  /// 从数据库取出的 map 还原成 UserModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int?,
      name: map['name'] as String?,
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      createdAt:
          map['createdAt'] != null ? DateTime.tryParse(map['createdAt']) : null,
      updatedAt:
          map['updatedAt'] != null ? DateTime.tryParse(map['updatedAt']) : null,
    );
  }

  /// JSON序列化
  Map<String, dynamic> toJson() => toMap();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel.fromMap(json);

  /// 更新部分字段
  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
