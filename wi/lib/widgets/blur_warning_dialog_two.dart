import 'dart:ui';
import 'package:flutter/material.dart';

/// はちわれブルー
const Color hachiwareBlue = Color(0xFF7CA8C8);

/// ⚠️ 警告用の模糊背景ダイアログ
class BlurWarningDialogTwo extends StatelessWidget {
  final VoidCallback onClose;

  const BlurWarningDialogTwo({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 320,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: hachiwareBlue,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(11),
                  topRight: Radius.circular(11),
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: const Center(
                child: Text(
                  '注意',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            // Message
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    '前回のバトルの結果が反映されていません。\n結果を確認します。',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '※正しい終了処理が行われない場合、レーティングマッチ、わくわくトレジャーバトル、トレーニングバトルへの参加を制限することがあります。',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),

            // OKボタン
            Container(
              width: double.infinity,
              height: 45,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: hachiwareBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: onClose, // 正确关闭
                child: const Text('OK'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🧊 ダイアログ呼び出し方法
void showBlurWarningDialogTwo(BuildContext context) {
  final overlayState = Overlay.of(context);
  late final OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => Stack(
      children: [
        // 背景模糊遮罩层
        Positioned.fill(
          child: GestureDetector(
            onTap: () {}, // 阻止点击穿透
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
          ),
        ),
        // 中心对话框
        Center(
          child: BlurWarningDialogTwo(
            onClose: () => overlayEntry.remove(), // 手动移除弹窗
          ),
        ),
      ],
    ),
  );

  overlayState.insert(overlayEntry);
}
