import 'package:flutter/material.dart';
import 'package:my/core/widgets/selectable_outlined_button_0713_v001.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  int selectedIndex = -1;

  final List<String> labels = ['Chats', 'Camera', 'Favorites'];

  final List<IconData> icons = [
    Icons.chat_bubble_outline,
    Icons.camera_alt_outlined,
    Icons.favorite_border,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("按钮选择界面"),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: List.generate(labels.length, (index) {
            return SelectableOutlinedButton(
              isSelected: selectedIndex == index,
              icon: icons[index],
              label: labels[index],
              onPressed: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            );
          }),
        ),
      ),
    );
  }
}
