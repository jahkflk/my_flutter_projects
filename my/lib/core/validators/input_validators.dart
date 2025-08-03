bool isValidEmail(String email) {
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}

bool isValidMac(String mac) {
  final macRegex = RegExp(r'^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$');
  return macRegex.hasMatch(mac);
}

bool isValidPassword(String password) {
  final pwRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#\$%^&*(),.?":{}|<>]).{8,64}$');
  return pwRegex.hasMatch(password);
}

bool isNotEmpty(String value) => value.trim().isNotEmpty;
