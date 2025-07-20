import 'package:flutter/material.dart';

class CodelabView extends StatelessWidget {
  const CodelabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('codelab')),
      body: const Center(child: Text('This is CodelabView')),
    );
  }
}
