import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class BaseSpeedDial extends StatelessWidget {
  final List<SpeedDialChild> children;

  const BaseSpeedDial({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.menu,
      activeIcon: Icons.close,
      spacing: 3,
      spaceBetweenChildren: 4,
      children: children,
    );
  }
}
