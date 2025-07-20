import 'package:flutter/material.dart';

class EnterpriseView extends StatelessWidget {
  const EnterpriseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('enterprise')),
      body: const Center(child: Text('This is EnterpriseView')),
    );
  }
}
