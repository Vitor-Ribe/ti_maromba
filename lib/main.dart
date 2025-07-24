import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:ti_maromba/pages/calendar_page.dart';
import 'package:ti_maromba/pages/config_page.dart';
import 'package:ti_maromba/pages/data_page.dart';
import 'package:ti_maromba/pages/home_page.dart';
import 'package:ti_maromba/pages/login/login_steps_page.dart';
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
      debugShowCheckedModeBanner: false, // remove banner

      // rota inicial
      initialRoute: '/login',

      // mapa das rotas disponiveis
      routes: {
        '/login': (context) => LoginStepsPage(),
        '/main': (context) => MyHomePage() // tela inicial
      }
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
