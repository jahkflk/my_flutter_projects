import 'package:flutter/material.dart';

class CustomWidgetsView extends StatelessWidget {
  const CustomWidgetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('custom-widgets')),
      body: const Center(child: Text('This is CustomWidgetsView')),
    );
  }
}
