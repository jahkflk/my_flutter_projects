import 'package:flutter/material.dart';

class FlutterOfficialView extends StatelessWidget {
  const FlutterOfficialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('flutter-official')),
      body: const Center(child: Text('This is FlutterOfficialView')),
    );
  }
}
