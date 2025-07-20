// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:my/core/widgets/selectable_outlined_button_with_pressed.dart';
// import 'package:my/features/projects/user_management/hooks_riverpod/features/auth/widgets/dialog_widget.dart';
// import '../viewmodels/auth_viewmodel.dart';
//
// class LoginPage extends HookConsumerWidget {
//   const LoginPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final emailCtrl = useTextEditingController();
//     final passCtrl = useTextEditingController();
//     final viewModel = ref.watch(authViewModelProvider.notifier);
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//                 controller: emailCtrl,
//                 decoration: const InputDecoration(labelText: 'Email')),
//             TextField(
//                 controller: passCtrl,
//                 obscureText: true,
//                 decoration: const InputDecoration(labelText: 'Password')),
//
//             const SizedBox(height: 24),
//
//             // ✅ 登录按钮
//             SelectableOutlinedButtonWithPressed(
//               isSelected: false,
//               isPressedOverride: false,
//               icon: Icons.login,
//               label: 'Login',
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (_) => DialogWidget(
//                     onConfirm: () async {
//                       final success = await viewModel.login(
//                         emailCtrl.text.trim(),
//                         passCtrl.text.trim(),
//                       );
//                       if (success && context.mounted) {
//                         context.go('/home');
//                       } else {
//                         context.pop(); // 先关闭 dialog
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Login failed')),
//                         );
//                       }
//                     },
//                   ),
//                 );
//               },
//               selectedBackgroundColor: Colors.black,
//               unselectedBackgroundColor: Colors.grey.shade100,
//               pressedBackgroundColor: Colors.grey.shade300,
//               selectedTextColor: Colors.white,
//               unselectedTextColor: Colors.black87,
//               pressedTextColor: Colors.black,
//               selectedIconColor: Colors.white,
//               unselectedIconColor: Colors.black54,
//               pressedIconColor: Colors.black87,
//               textStyle: const TextStyle(fontWeight: FontWeight.bold),
//               borderSide: const BorderSide(color: Colors.black),
//             ),
//
//             const SizedBox(height: 16),
//
//             // ✅ 注册按钮 - 一句话调用 Dialog
//             // 在 LoginPage 中调用
//             SelectableOutlinedButtonWithPressed(
//               isSelected: false,
//               isPressedOverride: false,
//               icon: Icons.person_add,
//               label: 'Login',
//               onPressed: () => showDialog(
//                 context: context,
//                 builder: (_) => DialogWidget(
//                   onConfirm: () => context.push('/home'), // ✨ 你可以跳去任何路由
//                 ),
//               ),
//               // 其余样式不变
//               selectedBackgroundColor: Colors.black,
//               unselectedBackgroundColor: Colors.grey.shade100,
//               pressedBackgroundColor: Colors.grey.shade300,
//               selectedTextColor: Colors.white,
//               unselectedTextColor: Colors.black87,
//               pressedTextColor: Colors.black,
//               selectedIconColor: Colors.white,
//               unselectedIconColor: Colors.black54,
//               pressedIconColor: Colors.black87,
//               textStyle: const TextStyle(fontWeight: FontWeight.bold),
//               borderSide: const BorderSide(color: Colors.black),
//             ),
//
//             const SizedBox(height: 16),
//
//             // ✅ 注册按钮 - 一句话调用 Dialog
//             // 在 LoginPage 中调用
//             SelectableOutlinedButtonWithPressed(
//               isSelected: false,
//               isPressedOverride: false,
//               icon: Icons.person_add,
//               label: 'Create Account',
//               onPressed: () => showDialog(
//                 context: context,
//                 builder: (_) => DialogWidget(
//                   onConfirm: () => context.push('/register'), // ✨ 你可以跳去任何路由
//                 ),
//               ),
//               // 其余样式不变
//               selectedBackgroundColor: Colors.black,
//               unselectedBackgroundColor: Colors.grey.shade100,
//               pressedBackgroundColor: Colors.grey.shade300,
//               selectedTextColor: Colors.white,
//               unselectedTextColor: Colors.black87,
//               pressedTextColor: Colors.black,
//               selectedIconColor: Colors.white,
//               unselectedIconColor: Colors.black54,
//               pressedIconColor: Colors.black87,
//               textStyle: const TextStyle(fontWeight: FontWeight.bold),
//               borderSide: const BorderSide(color: Colors.black),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
