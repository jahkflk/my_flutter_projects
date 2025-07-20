// lib/core/widgets/icon_text_button.dart
import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool isSelected;
  final double iconSize;
  final double fontSize;

  const IconTextButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isSelected = false,
    this.iconSize = 28.0,
    this.fontSize = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isSelected ? Colors.blue : Colors.white;
    final Color foregroundColor = isSelected ? Colors.white : Colors.black;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: iconSize, color: foregroundColor),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                color: foregroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
