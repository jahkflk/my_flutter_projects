import 'package:flutter/material.dart';

class CustomDialogOne extends StatefulWidget {
  const CustomDialogOne({super.key});

  @override
  State<CustomDialogOne> createState() => _CustomDialogOneState();
}

class _CustomDialogOneState extends State<CustomDialogOne> {
  bool _dontShowAgain = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      backgroundColor: Colors.transparent,
      child: Container(
        width: 320,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.orange,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.error, color: Colors.red),
                  SizedBox(width: 8),
                  Text('確認', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              child: Column(
                children: const [
                  Text(
                    '・フラグメントが装備されていません。',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  Text('このパーティでマッチングを開始しますか？'),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  StatefulBuilder(
                    builder: (context, setState) => Checkbox(
                      value: _dontShowAgain,
                      onChanged: (value) {
                        setState(() {
                          _dontShowAgain = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '次回からダイアログを表示しない',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '※オプションで再設定が可能です。',
                  style: TextStyle(color: Colors.red, fontSize: 10),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.all(4),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('いいえ'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.all(4),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[700],
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('はい'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
