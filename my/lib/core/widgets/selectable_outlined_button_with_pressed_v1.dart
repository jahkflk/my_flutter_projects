import 'package:flutter/material.dart';

/// A customizable outlined button widget that provides visual feedback for
/// selected, pressed, and hovered states.
///
/// This widget is particularly useful when you want consistent styling
/// for interactive buttons such as tabs, filters, or login buttons.
///
/// ### Example usage:
/// ```dart
/// SelectableOutlinedButtonWithPressed(
///   isSelected: false,
///   icon: Icons.login,
///   label: 'Login',
///   onPressed: () => print('Pressed'),
///   selectedBackgroundColor: Colors.blue.shade900,
///   unselectedBackgroundColor: Colors.white,
///   pressedBackgroundColor: Colors.blue.shade900,
///   selectedTextColor: Colors.white,
///   unselectedTextColor: Colors.black87,
///   pressedTextColor: Colors.white,
///   selectedIconColor: Colors.white,
///   unselectedIconColor: Colors.black54,
///   pressedIconColor: Colors.white,
///   textStyle: const TextStyle(fontWeight: FontWeight.bold),
///   borderSide: const BorderSide(color: Colors.blueGrey),
/// )
/// ```
class SelectableOutlinedButtonWithPressed extends StatefulWidget {
  /// Whether this button is in selected state.
  final bool isSelected;

  /// The icon to display.
  final IconData icon;

  /// The label text.
  final String label;

  /// Called when the button is pressed.
  final VoidCallback onPressed;

  /// Background color when selected.
  final Color selectedBackgroundColor;

  /// Background color when not selected.
  final Color unselectedBackgroundColor;

  /// Background color when pressed or hovered.
  final Color pressedBackgroundColor;

  /// Text color when selected.
  final Color selectedTextColor;

  /// Text color when not selected.
  final Color unselectedTextColor;

  /// Text color when pressed or hovered.
  final Color pressedTextColor;

  /// Icon color when selected.
  final Color selectedIconColor;

  /// Icon color when not selected.
  final Color unselectedIconColor;

  /// Icon color when pressed or hovered.
  final Color pressedIconColor;

  /// The base text style.
  final TextStyle textStyle;

  /// The border style for the button.
  final BorderSide borderSide;

  /// Creates a [SelectableOutlinedButtonWithPressed].
  const SelectableOutlinedButtonWithPressed({
    super.key,
    required this.isSelected,
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
  bool _isPressed = false;
  bool _isHovered = false;

  void _handleTapDown(_) => setState(() => _isPressed = true);
  void _handleTapUp(_) => setState(() => _isPressed = false);
  void _handleTapCancel() => setState(() => _isPressed = false);
  void _handleHover(bool isHovering) => setState(() => _isHovered = isHovering);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _isPressed
        ? widget.pressedBackgroundColor
        : widget.isSelected
            ? widget.selectedBackgroundColor
            : _isHovered
                ? widget.pressedBackgroundColor.withOpacity(0.08)
                : widget.unselectedBackgroundColor;

    final textColor = _isPressed
        ? widget.pressedTextColor
        : widget.isSelected
            ? widget.selectedTextColor
            : widget.unselectedTextColor;

    final iconColor = _isPressed
        ? widget.pressedIconColor
        : widget.isSelected
            ? widget.selectedIconColor
            : widget.unselectedIconColor;

    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        child: OutlinedButton.icon(
          onPressed: widget.onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor,
            side: widget.borderSide,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          icon: Icon(widget.icon, color: iconColor),
          label: Text(
            widget.label,
            style: widget.textStyle.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
