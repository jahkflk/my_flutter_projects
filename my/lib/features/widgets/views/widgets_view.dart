import 'package:flutter/material.dart';

class WidgetsView extends StatelessWidget {
  const WidgetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('widgets')),
      body: const Center(child: Text('This is WidgetsView')),
    );
  }
}
