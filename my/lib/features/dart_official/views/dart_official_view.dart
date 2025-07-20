import 'package:flutter/material.dart';

class DartOfficialView extends StatelessWidget {
  const DartOfficialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('dart-official')),
      body: const Center(child: Text('This is DartOfficialView')),
    );
  }
}
