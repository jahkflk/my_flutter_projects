class RegisterFormState {
  final String email;
  final String confirmEmail;
  final String mac;
  final String password;
  final bool isSubmitting;

  const RegisterFormState({
    this.email = '',
    this.confirmEmail = '',
    this.mac = '',
    this.password = '',
    this.isSubmitting = false,
  });

  RegisterFormState copyWith({
    String? email,
    String? confirmEmail,
    String? mac,
    String? password,
    bool? isSubmitting,
  }) {
    return RegisterFormState(
      email: email ?? this.email,
      confirmEmail: confirmEmail ?? this.confirmEmail,
      mac: mac ?? this.mac,
      password: password ?? this.password,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}
