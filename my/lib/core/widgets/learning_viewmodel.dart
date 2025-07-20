import 'package:flutter/material.dart';

class SelectableOutlinedButton extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color selectedBackgroundColor;
  final Color unselectedBackgroundColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final TextStyle textStyle;
  final BorderSide borderSide;

  const SelectableOutlinedButton({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.selectedBackgroundColor,
    required this.unselectedBackgroundColor,
    required this.selectedTextColor,
    required this.unselectedTextColor,
    required this.selectedIconColor,
    required this.unselectedIconColor,
    required this.textStyle,
    required this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        backgroundColor:
            isSelected ? selectedBackgroundColor : unselectedBackgroundColor,
        side: borderSide,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: isSelected ? selectedIconColor : unselectedIconColor,
      ),
      label: Text(
        label,
        style: textStyle.copyWith(
          color: isSelected ? selectedTextColor : unselectedTextColor,
        ),
      ),
    );
  }
}
