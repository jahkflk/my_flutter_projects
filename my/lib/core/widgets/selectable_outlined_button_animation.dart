import 'package:flutter/material.dart';

class SelectableOutlinedButton extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Animation<double> scaleAnimation;

  const SelectableOutlinedButton({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.scaleAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isSelected ? Colors.black : Colors.grey.shade200;
    final textColor = isSelected ? Colors.yellow : Colors.black;
    final iconColor = isSelected ? Colors.yellow : Colors.black54;

    return ScaleTransition(
      scale: scaleAnimation,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: const BorderSide(color: Colors.black),
        ),
        onPressed: onPressed,
        icon: Icon(icon, color: iconColor),
        label: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
