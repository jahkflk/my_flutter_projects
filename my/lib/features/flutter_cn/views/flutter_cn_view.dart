import 'package:flutter/material.dart';

class FlutterCnView extends StatelessWidget {
  const FlutterCnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('flutter-cn')),
      body: const Center(child: Text('This is FlutterCnView')),
    );
  }
}
