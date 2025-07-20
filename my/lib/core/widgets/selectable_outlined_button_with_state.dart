import 'package:flutter/material.dart';

/// A customizable outlined button with pressed, hover, and selection feedback.
class SelectableOutlinedButtonWithState extends StatefulWidget {
  final bool isSelected;
  final bool isPressed;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color selectedBackgroundColor;
  final Color unselectedBackgroundColor;
  final Color pressedBackgroundColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Color pressedTextColor;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final Color pressedIconColor;
  final TextStyle textStyle;
  final BorderSide borderSide;

  const SelectableOutlinedButtonWithState({
    super.key,
    required this.isSelected,
    required this.isPressed,
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.selectedBackgroundColor,
    required this.unselectedBackgroundColor,
    required this.pressedBackgroundColor,
    required this.selectedTextColor,
    required this.unselectedTextColor,
    required this.pressedTextColor,
    required this.selectedIconColor,
    required this.unselectedIconColor,
    required this.pressedIconColor,
    required this.textStyle,
    required this.borderSide,
  });

  @override
  State<SelectableOutlinedButtonWithState> createState() =>
      _SelectableOutlinedButtonWithStateState();
}

class _SelectableOutlinedButtonWithStateState
    extends State<SelectableOutlinedButtonWithState> {
  bool _isHovered = false;

  void _handleHover(bool hovering) {
    setState(() => _isHovered = hovering);
  }

  @override
  Widget build(BuildContext context) {
    final isPressed = widget.isPressed;
    final bgColor = isPressed
        ? widget.pressedBackgroundColor
        : widget.isSelected
            ? widget.selectedBackgroundColor
            : _isHovered
                ? widget.selectedBackgroundColor // ✅ hover 时用 hover 背景色
                : widget.unselectedBackgroundColor;

    final textColor = isPressed
        ? widget.pressedTextColor
        : widget.isSelected
            ? widget.selectedTextColor
            : widget.unselectedTextColor;
    final iconColor = isPressed
        ? widget.pressedIconColor
        : widget.isSelected
            ? widget.selectedIconColor
            : widget.unselectedIconColor;

    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          backgroundColor: bgColor,
          side: widget.borderSide,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: widget.onPressed,
        icon: Icon(widget.icon, color: iconColor),
        label: Text(widget.label,
            style: widget.textStyle.copyWith(color: textColor)),
      ),
    );
  }
}
