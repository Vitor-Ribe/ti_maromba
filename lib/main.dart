import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:ti_maromba/pages/config_page.dart';
import 'package:ti_maromba/pages/data_page.dart';
import 'package:ti_maromba/pages/home_page.dart';
import 'package:ti_maromba/res/colors.dart';

void main() {
  // deixar barra de notificação com icones em branco
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark, // iOS
    ),
  );

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

  @override
  Widget build(BuildContext context) {
    final items = <Widget> [
      Icon(Icons.home, size: 30, color: Colors.white),
      Icon(Icons.monitor_heart, size: 30, color: Colors.white),
      Icon(Icons.person, size: 30, color: Colors.white)
    ];

    return Scaffold(
      appBar: null,
      body:(screens[index]),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.primary,
        animationCurve: Curves.easeInOut,
        color: AppColors.bottomNavBarBG,
        animationDuration: Duration(milliseconds: 300),
        height: 75,
        items: items,
        index: index,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
