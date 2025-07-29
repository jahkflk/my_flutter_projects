import 'package:flutter/material.dart';
import 'package:my/core/widgets/selectable_outlined_button.dart';

class SelectableOutlinedButtonStyle1 extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const SelectableOutlinedButtonStyle1({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableOutlinedButton(
      isSelected: isSelected,
      icon: icon,
      label: label,
      onPressed: onPressed,
      selectedBackgroundColor: Colors.black,
      unselectedBackgroundColor: Colors.grey.shade100,
      selectedTextColor: Colors.yellow,
      unselectedTextColor: Colors.black87,
      selectedIconColor: Colors.yellow,
      unselectedIconColor: Colors.black45,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      borderSide: const BorderSide(color: Colors.black),
    );
  }
}
