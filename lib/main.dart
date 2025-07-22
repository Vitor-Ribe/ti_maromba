import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TI Maromba',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'TI Maromba'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final items = <Widget> [
      Icon(Icons.home, size: 30, color: Colors.white),
      Icon(Icons.monitor_heart, size: 30, color: Colors.white),
      Icon(Icons.water_drop, size: 30, color: Colors.white),
      Icon(Icons.percent, size: 30, color: Colors.white),
      Icon(Icons.person, size: 30, color: Colors.white)
    ];

    return Scaffold(
      appBar: AppBar(
       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello World!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              color: Colors.blue.shade700,
              animationDuration: Duration(milliseconds: 300),
              height: 75,
              items: items,
              index: index,
              onTap: (index) => setState(() => this.index = index),
            ),
    );
  }
}
