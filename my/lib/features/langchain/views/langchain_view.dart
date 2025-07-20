import 'package:flutter/material.dart';

class LangchainView extends StatelessWidget {
  const LangchainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('langchain')),
      body: const Center(child: Text('This is LangchainView')),
    );
  }
}
