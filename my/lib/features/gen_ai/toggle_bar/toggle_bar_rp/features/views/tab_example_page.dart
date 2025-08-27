import 'package:flutter/material.dart';

class TabExamplePage extends StatelessWidget {
  const TabExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // 未来可以改成更多 tab
      child: Scaffold(
        appBar: AppBar(
          title: const Text('フラグメント大強化祭'),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: TabBar(
              tabs: [
                Tab(text: '強化'),
                Tab(text: 'スロット再強化'),
                Tab(text: '売却'),
              ],
              indicatorColor: Colors.orange,
              indicatorWeight: 4,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            FragmentEnhancePage(title: '強化'),
            FragmentEnhancePage(title: 'スロット再強化'),
            FragmentEnhancePage(title: '売却'),
          ],
        ),
      ),
    );
  }
}

class FragmentEnhancePage extends StatelessWidget {
  final String title;
  const FragmentEnhancePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$title ページの内容',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
