import 'package:flutter/material.dart';

class GithubView extends StatelessWidget {
  const GithubView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('github')),
      body: const Center(child: Text('This is GithubView')),
    );
  }
}
