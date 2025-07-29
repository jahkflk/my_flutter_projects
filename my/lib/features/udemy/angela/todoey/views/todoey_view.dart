import 'package:flutter/material.dart';

import 'tasks_screen.dart';

class TodoeyView extends StatelessWidget {
  const TodoeyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Center(
          child: const Text('TodoeyView'),
        ),
      ),
      body: TasksScreen(),
    );
  }
}
