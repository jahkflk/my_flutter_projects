import 'package:flutter/material.dart';

class ShopAppView extends StatelessWidget {
  const ShopAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('shop-app')),
      body: const Center(child: Text('This is ShopAppView')),
    );
  }
}
