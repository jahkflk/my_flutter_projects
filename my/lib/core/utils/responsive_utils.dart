// lib/core/utils/responsive_utils.dart
import 'package:flutter/material.dart';

double calculateResponsiveItemWidth({
  required BuildContext context,
  required int columns,
  double spacing = 12, // 👈 可选，不传时默认12
  double horizontalPadding = 32, // 👈 可选，不传时默认32（比如 Padding.all(16)）
}) {
  final screenWidth = MediaQuery.of(context).size.width;
  final totalSpacing = spacing * (columns - 1);
  return (screenWidth - horizontalPadding - totalSpacing) / columns;
}
