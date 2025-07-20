import 'package:flutter/material.dart';

class CrossPlatformView extends StatelessWidget {
  const CrossPlatformView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('cross-platform')),
      body: const Center(child: Text('This is CrossPlatformView')),
    );
  }
}
