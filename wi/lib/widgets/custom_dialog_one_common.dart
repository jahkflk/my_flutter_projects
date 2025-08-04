import 'package:flutter/material.dart';

class CustomConfirmDialogOneCommon extends StatefulWidget {
  final String title;
  final Color titleColor;
  final IconData icon;
  final Color iconColor;
  final Widget content;
  final bool showCheckbox;
  final VoidCallback? onConfirmed;
  final VoidCallback? onCancelled;
  final String confirmText;
  final String cancelText;

  const CustomConfirmDialogOneCommon({
    super.key,
    required this.title,
    required this.titleColor,
    required this.icon,
    required this.iconColor,
    required this.content,
    this.showCheckbox = false,
    this.onConfirmed,
    this.onCancelled,
    this.confirmText = 'はい',
    this.cancelText = 'いいえ',
  });

  @override
  State<CustomConfirmDialogOneCommon> createState() => _CustomConfirmDialogOneCommonState();
}

class _CustomConfirmDialogOneCommonState extends State<CustomConfirmDialogOneCommon> {
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
              color: widget.titleColor,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(widget.icon, color: widget.iconColor),
                  const SizedBox(width: 8),
                  Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              child: widget.content,
            ),
            const Divider(),
            if (widget.showCheckbox)
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
                    const Expanded(
                      child: Text(
                        '次回からダイアログを表示しない',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            if (widget.showCheckbox)
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
                      onPressed: () {
                        Navigator.of(context).pop(false);
                        widget.onCancelled?.call();
                      },
                      child: Text(widget.cancelText),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.all(4),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue[700],
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                        widget.onConfirmed?.call();
                      },
                      child: Text(widget.confirmText),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
