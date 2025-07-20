import 'package:flutter/material.dart';

class SelectableOutlinedButton extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  // 可自定义颜色、文字样式等
  final Color selectedBackgroundColor;
  final Color unselectedBackgroundColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final TextStyle? textStyle;
  final double borderRadius;
  final EdgeInsets padding;
  final BorderSide? borderSide;

  const SelectableOutlinedButton({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.selectedBackgroundColor = Colors.blue,
    this.unselectedBackgroundColor = Colors.transparent,
    this.selectedTextColor = Colors.white,
    this.unselectedTextColor = const Color(0xFF999999),
    this.selectedIconColor = Colors.white,
    this.unselectedIconColor = const Color(0xFF999999),
    this.textStyle,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: isSelected ? selectedIconColor : unselectedIconColor,
      ),
      label: Text(
        label,
        style: textStyle ??
            TextStyle(
              color: isSelected ? selectedTextColor : unselectedTextColor,
            ),
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor:
            isSelected ? selectedBackgroundColor : unselectedBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
        side: borderSide,
      ),
    );
  }
}
