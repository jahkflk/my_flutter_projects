// dialog_widget.dart
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class DialogWidget extends StatelessWidget {
  final VoidCallback onConfirm; // ✨ 新增：按下确认按钮要做的事

  const DialogWidget({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Create Account'),
      content: const Text('Please proceed to create your account.'),
      actions: [
        CupertinoDialogAction(
          child: const Text('Cancel'),
          onPressed: () => context.pop(),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Go Register'),
          onPressed: () {
            context.pop(); // 先关闭对话框
            onConfirm(); // ✨ 调用外部传入的回调
          },
        ),
      ],
    );
  }
}
