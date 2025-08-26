class User {
  final String id;
  final String email;
  final String mac;
  final String password;

  const User({
    required this.id,
    required this.email,
    required this.mac,
    required this.password,
  });

  User copyWith({
    String? email,
    String? mac,
    String? password,
  }) {
    return User(
      id: id,
      email: email ?? this.email,
      mac: mac ?? this.mac,
      password: password ?? this.password,
    );
  }
}
