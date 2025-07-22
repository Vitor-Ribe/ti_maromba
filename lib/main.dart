import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ti_maromba/pages/config_page.dart';
import 'package:ti_maromba/pages/data_page.dart';
import 'package:ti_maromba/pages/home_page.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  final screens = [
    HomePage(),
    DataPage(),
    ConfigPage()
  ];

  final pageTitles = [
    'Tela Inicial',
    'Dados de atividade',
    'Configurações'
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget> [
      Icon(Icons.home, size: 30, color: Colors.white),
      Icon(Icons.monitor_heart, size: 30, color: Colors.white),
      Icon(Icons.person, size: 30, color: Colors.white)
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitles[index], style: TextStyle(color: Colors.blue.shade900)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true
      ),
      body:(screens[index]),
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
