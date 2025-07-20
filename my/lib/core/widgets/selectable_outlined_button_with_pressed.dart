import 'package:flutter/material.dart';

/// A customizable outlined button with pressed and hover feedback.
class SelectableOutlinedButtonWithPressed extends StatefulWidget {
  final bool isSelected;
  final bool isPressedOverride;

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

  const SelectableOutlinedButtonWithPressed({
    super.key,
    required this.isSelected,
    required this.isPressedOverride,
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
  State<SelectableOutlinedButtonWithPressed> createState() =>
      _SelectableOutlinedButtonWithPressedState();
}

class _SelectableOutlinedButtonWithPressedState
    extends State<SelectableOutlinedButtonWithPressed> {
  bool _isHovered = false;

  void _handleHover(bool hovering) {
    setState(() => _isHovered = hovering);
  }

  @override
  Widget build(BuildContext context) {
    final isPressed = widget.isPressedOverride;

    final bgColor = isPressed
        ? widget.pressedBackgroundColor
        : widget.isSelected
            ? widget.selectedBackgroundColor
            : _isHovered
                ? widget.pressedBackgroundColor
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
