import 'package:flutter/material.dart';

class UdemyView extends StatelessWidget {
  const UdemyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('udemy')),
      body: const Center(child: Text('This is UdemyView')),
    );
  }
}
