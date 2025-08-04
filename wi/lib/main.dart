import 'package:flutter/material.dart';
import 'package:wi/widgets/blur_warning_dialog.dart';
import 'package:wi/widgets/blur_warning_dialog_two.dart';
import 'package:wi/widgets/custom_dialog_one.dart';
import 'package:wi/widgets/custom_dialog_one_common.dart';
import 'package:wi/widgets/warning_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom Dialog Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void _showCustomDialogOne(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => const CustomDialogOne(),
    );

if (!context.mounted) return;
    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result ? 'ユーザー選択：はい' : 'ユーザー選択：いいえ')),
      );
    }
  }

  void _showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const WarningDialog(),
    );
  }

  void _showBlurWarningDialog(BuildContext context) {
    showBlurWarningDialog(context); // 调用 blur_warning_dialog.dart 中的方法
  }

    void _showBlurWarningDialogTwo(BuildContext context) {
    showBlurWarningDialogTwo(context); // 调用 blur_warning_dialog.dart 中的方法
  }

  void _showCustomConfirmDialogOneCommon(BuildContext context) {
    showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => CustomConfirmDialogOneCommon(
        title: '共通コンポーネントダイアログを表示',
        titleColor: const Color(0xFF81C7D4), // はちわれのブルー
        icon: Icons.error,
        iconColor: Colors.red,
        content: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('・共通コンポーネントダイアログを表示のテキスト内容',
                style: TextStyle(color: Colors.red, fontSize: 14)),
            SizedBox(height: 10),
            Text('このパーティでマッチングを開始しますか？'),
          ],
        ),
        showCheckbox: true,
        onConfirmed: () {
          debugPrint('Confirmed');
          // 你可以加上其他逻辑
        },
        onCancelled: () {
          debugPrint('Cancelled');
          // 你可以加上其他逻辑
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Dialog Sample')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => _showCustomDialogOne(context),
              child: const Text('確認ダイアログを表示'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showWarningDialog(context),
              child: const Text('注意ダイアログを表示'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showBlurWarningDialog(context),
              child: const Text('モーダル + 模糊注意ダイアログを表示'),
            ),
                        const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showBlurWarningDialogTwo(context),
              child: const Text('モーダル + 模糊注意ダイアログを表示 + はちわれ'),
            ),

                        const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showCustomConfirmDialogOneCommon(context),
              child: const Text('共通コンポーネントダイアログを表示'),
            ),
          ],
        ),
      ),
    );
  }
}
