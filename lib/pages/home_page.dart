import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Bem Vindo(a), Name!', textAlign: TextAlign.center, style: TextStyle(color: Colors.blue.shade700, fontSize: 35)),

            SizedBox(height: 50),

            // Banners
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  // Banner àgua
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: 170,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [Colors.blue.shade700, Colors.lightBlueAccent.shade100],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                        )
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 2),
                        Icon(Icons.opacity, size: 30, color: Colors.white),
                        SizedBox(width: 5),
                        Text('Água ml', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20))
                      ],
                    ),
                  ),

                  SizedBox(width: 10),

                  // Banner calorias
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: 170,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [Colors.orange.shade700, Colors.orangeAccent.shade100],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                        )
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 2),
                        Icon(Icons.percent, size: 30, color: Colors.white),
                        SizedBox(width: 5),
                        Text('Calorias', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20))
                      ],
                    ),
                  ),
                ]
              )
            ),
          ],
        ),
      )
    );
  }
}