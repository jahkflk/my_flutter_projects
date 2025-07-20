import 'package:flutter/material.dart';

class YoutubeView extends StatelessWidget {
  const YoutubeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('youtube')),
      body: const Center(child: Text('This is YoutubeView')),
    );
  }
}
