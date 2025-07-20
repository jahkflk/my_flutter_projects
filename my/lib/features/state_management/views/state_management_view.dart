import 'package:flutter/material.dart';

class StateManagementView extends StatelessWidget {
  const StateManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('state-management')),
      body: const Center(child: Text('This is StateManagementView')),
    );
  }
}
