// lib/core/widgets/empty_placeholder.dart
import 'package:flutter/material.dart';

class EmptyPlaceholder extends StatelessWidget {
  final String message;
  final IconData icon;
  final double iconSize;
  final TextStyle? textStyle;

  const EmptyPlaceholder({
    super.key,
    this.message = 'No data available',
    this.icon = Icons.inbox,
    this.iconSize = 48.0,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final style = textStyle ??
        Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: iconSize, color: Colors.grey),
          const SizedBox(height: 12),
          Text(message, style: style),
        ],
      ),
    );
  }
}
