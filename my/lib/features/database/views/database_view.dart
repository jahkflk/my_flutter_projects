import 'package:flutter/material.dart';

class DatabaseView extends StatelessWidget {
  const DatabaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('database')),
      body: const Center(child: Text('This is DatabaseView')),
    );
  }
}
