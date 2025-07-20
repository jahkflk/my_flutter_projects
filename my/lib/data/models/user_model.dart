class UserModel {
  final int? id;
  final String username;
  final String email;
  final String password;

  UserModel({
    this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int?,
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
