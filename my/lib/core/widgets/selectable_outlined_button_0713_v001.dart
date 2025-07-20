import 'package:flutter/material.dart';

class SelectableOutlinedButton extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color unselectedColor;
  final Color selectedBackgroundColor;
  final double borderRadius;
  final EdgeInsets padding;

  const SelectableOutlinedButton({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.unselectedColor = const Color.fromARGB(255, 153, 153, 153),
    this.selectedBackgroundColor = Colors.blue,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = isSelected ? Colors.black : unselectedColor;
    final textColor = isSelected ? Colors.black : unselectedColor;

    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: iconColor),
      label: Text(label, style: TextStyle(color: textColor)),
      style: OutlinedButton.styleFrom(
        backgroundColor:
            isSelected ? selectedBackgroundColor : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
      ),
    );
  }
}
