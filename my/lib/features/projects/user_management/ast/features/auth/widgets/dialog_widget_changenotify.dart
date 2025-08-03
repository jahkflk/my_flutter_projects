import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DialogWidget extends StatefulWidget {
  final Future<bool> Function() onConfirm;

  const DialogWidget({super.key, required this.onConfirm});

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  Future<bool>? _loginFuture;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Confirm Login'),
      content: _loginFuture == null
          ? const Text('Do you want to login with the entered credentials?')
          : FutureBuilder<bool>(
              future: _loginFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    height: 50,
                    child: Center(child: CupertinoActivityIndicator()),
                  );
                } else if (snapshot.hasError) {
                  return Text('Login failed: ${snapshot.error}');
                } else if (snapshot.hasData && snapshot.data == true) {
                  return const Text('Login successful! Redirecting...');
                } else {
                  return const Text('Login failed. Please try again.');
                }
              },
            ),
      actions: _loginFuture == null
          ? [
              CupertinoDialogAction(
                onPressed: () => context.pop(null),
                child: const Text('Cancel'),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  setState(() {
                    _loginFuture = widget.onConfirm();
                  });

                  // 监听登录结果，关闭dialog并返回bool
                  _loginFuture!.then((success) {
                    if (mounted) {
                      context.pop(success);
                    }
                  });
                },
                child: const Text('Confirm'),
              ),
            ]
          : [],
    );
  }
}
