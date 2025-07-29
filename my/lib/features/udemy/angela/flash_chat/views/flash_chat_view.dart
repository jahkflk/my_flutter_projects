import 'package:flutter/material.dart';

class FlashChatView extends StatelessWidget {
  const FlashChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('flash_chat')),
      body: const Center(child: Text('This is flash_chat')),
    );
  }
}
