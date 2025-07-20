// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../../data/db/db_helper.dart';
//
// final authViewModelProvider = Provider<AuthViewModel>((ref) {
//   return AuthViewModel();
// });
//
// class AuthViewModel {
//   final DBHelper db = DBHelper();
//
//   Future<bool> login(String email, String password) async {
//     final user = await db.getUserByEmail(email);
//     return user != null && user['password'] == password;
//   }
//
//   Future<bool> register(String email, String password) async {
//     try {
//       await db.insertUser({
//         'email': email,
//         'password': password,
//         'name': '',
//       });
//       return true;
//     } catch (e) {
//       // 重複エラーなどはfalse返し、その他はthrowでもOK
//       return false;
//     }
//   }
// }
