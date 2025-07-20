import 'package:flutter/material.dart';

class GenAiView extends StatelessWidget {
  const GenAiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('gen-ai')),
      body: const Center(child: Text('This is GenAiView')),
    );
  }
}
