import 'package:flutter/material.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blueGrey,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'Nome do Usuário',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'usuario@ifnmg.edu.br',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}