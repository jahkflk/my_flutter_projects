import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  int selectedIndex = -1; // -1 表示无选择

  final List<String> labels = ['Chats', 'Camera', 'Favorites'];

  final List<IconData> icons = [
    Icons.chat_bubble_outline,
    // Icons.camera_enhance,
    Icons.camera_alt_outlined,
    Icons.favorite_border,
  ];

  // final Color myColor = const Color.fromARGB(255, 68, 68, 68); // 不透明
  final Color myColor = const Color.fromARGB(255, 153, 153, 153);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColorDark,
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
            final isSelected = selectedIndex == index;
            return OutlinedButton.icon(
              onPressed: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              icon: Icon(
                icons[index],
                color: isSelected ? Colors.black : myColor,
              ),
              label: Text(
                labels[index],
                style: TextStyle(
                  color: isSelected ? Colors.black : myColor,
                ),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: isSelected ? Colors.blue : Colors.transparent,
                // side: const BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            );
          }),
        ),
      ),
    );
  }
}
