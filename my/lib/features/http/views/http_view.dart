import 'package:flutter/material.dart';

class HttpView extends StatelessWidget {
  const HttpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('http')),
      body: const Center(child: Text('This is HttpView')),
    );
  }
}
