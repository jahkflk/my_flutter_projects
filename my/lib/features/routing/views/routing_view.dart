import 'package:flutter/material.dart';

class RoutingView extends StatelessWidget {
  const RoutingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('routing')),
      body: const Center(child: Text('This is RoutingView')),
    );
  }
}
