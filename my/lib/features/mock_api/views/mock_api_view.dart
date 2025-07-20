import 'package:flutter/material.dart';

class MockApiView extends StatelessWidget {
  const MockApiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('mock-api')),
      body: const Center(child: Text('This is MockApiView')),
    );
  }
}
