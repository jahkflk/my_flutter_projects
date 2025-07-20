import 'package:flutter/material.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const myHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class myHomePage extends StatefulWidget {
  const myHomePage({super.key, required this.title});

  final String title;

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Container(
          // double.infinity 表示“无限宽度”，Flutter 会让 Container 在父级允许的范围内尽可能变宽。
          // 常用于让 Container、TextField、Card 等横向撑满一行。
          width: double.infinity,
          color: Colors.teal[300],

          // margin: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          // margin: EdgeInsets.only(left: 30.0),
          // padding: const EdgeInsets.all(16), // 你可以在这里设置样式
          child: Column(
            // 用 Column + CrossAxisAlignment.stretch 实现横向填满
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'You have pushed the button this many times:',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('普通按钮'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
