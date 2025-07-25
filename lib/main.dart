import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ti_maromba/pages/calendar_page.dart';
import 'package:ti_maromba/pages/config_page.dart';
import 'package:ti_maromba/pages/data_page.dart';
import 'package:ti_maromba/pages/home_page.dart';
import 'package:ti_maromba/pages/login/login_steps_page.dart';
import 'package:ti_maromba/res/colors.dart';

import 'app/database/db_script.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // obrigatório para uso async no main()

  // deixar barra de notificação com icones em branco
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark, // iOS
    ),
  );

  final db = await openAppDatabase();
  final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM user'),
  ) ?? 0;

  runApp(MyApp(
    initialRoute: count == 0 ? '/login' : '/main',
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({required this.initialRoute, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      routes: {
        '/login': (context) => const LoginStepsPage(),
        '/main': (context) => const MyHomePage(),
      },
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
    CalendarPage(),
    DataPage(),
    ConfigPage()
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget> [
      Icon(Icons.home_outlined, size: 30, color: index == 0 ? AppColors.primary : Colors.grey),
      Icon(Icons.calendar_month_outlined, size: 30, color: index == 1 ? AppColors.primary : Colors.grey),
      Icon(Icons.bar_chart_outlined, size: 30, color: index == 2 ? AppColors.primary : Colors.grey),
      Icon(Icons.person_outline, size: 30, color: index == 3 ? AppColors.primary : Colors.grey)
    ];

    return Scaffold(
      appBar: null,
      body:(screens[index]),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.background,
        buttonBackgroundColor: AppColors.secondary,
        animationCurve: Curves.easeInOut,
        color: AppColors.secondary,
        animationDuration: Duration(milliseconds: 300),
        height: 75,
        items: items,
        index: index,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
