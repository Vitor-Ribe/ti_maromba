import 'package:flutter/material.dart';
import 'package:ti_maromba/res/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<Map<String, String>> itens = [
    {
      'titulo': 'Peito &\nTríceps',
      'imagem': 'assets/images/workout/chest.jpg',
    },
    {
      'titulo': 'Costas &\nBíceps',
      'imagem': 'assets/images/workout/back.jpg',
    },
    {
      'titulo': 'Pernas, Ombros\n& Abdômen',
      'imagem': 'assets/images/workout/legs.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Boas-Vindas
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // alinhamento dos textos
                  children: [
                    Text('Olá, Name', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 20)),
                    Text('Vamos Treinar!', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold))
                  ],
                ),

                SizedBox(width: 40),

                // avatar
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                )
              ]
            ),

            SizedBox(height: 20),

            // Search
            Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Pesquisar',
                  prefixIcon: Icon(Icons.search, color: AppColors.primary),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(
                      color: Colors.black38,
                      width: 1.0
                    )
                  ),
                  filled: false,
                ),
              ),
            ),

            SizedBox(height: 60),

            // SEÇÃO DOS ÚLTIMOS RESULTADOS
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Text('Resultados Desta Semana', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),

                SizedBox(height: 20),

                // Cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    // Calorias
                    Container(
                      width: 102,
                      height: 115,
                      padding: EdgeInsets.only(top: 15, left: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.secondary
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.local_fire_department_outlined, size: 30, color: AppColors.primary),
                          SizedBox(height: 5),
                          Text('2100',  textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 2),
                          Text('Cal',  textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 15))
                        ],
                      ),
                    ),


                    // Horas de treino
                    Container(
                      width: 102,
                      height: 115,
                      padding: EdgeInsets.only(top: 15, left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.secondary
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.hourglass_empty, size: 30, color: AppColors.primary),
                          SizedBox(height: 5),
                          Text('21h',  textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 2),
                          Text('34m',  textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 15))
                        ],
                      ),
                    ),


                    // Peso levantado
                    Container(
                      width: 102,
                      height: 115,
                      padding: EdgeInsets.only(top: 15, left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.secondary
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.shopping_bag, size: 30, color: AppColors.primary),
                          SizedBox(height: 5),
                          Text('1450',  textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 2),
                          Text('Kg',  textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 15))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 60),

            // SEÇÃO DOS PLANOS DE TREINO
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Text('Seus planos de treino', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),

                SizedBox(height: 20),

                // Cards
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.8,
                  ),
                  items: itens.map((item) {
                    return Builder(
                      builder: (context) {
                        return Stack(
                          children: [
                            // Container da imagem
                            Container(
                              width: 300,
                              height: 200,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[300],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    // imagem
                                    Image.asset(
                                      item['imagem']!,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                    // Degradê
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Colors.black.withValues(alpha: 1.0), // mais escuro embaixo
                                            Colors.black.withValues(alpha: 0.4),  // meio transparente
                                            Colors.transparent,              // transparente no topo
                                          ],
                                          stops: [0.0, 0.5, 1.0], // controla onde cada cor começa/finaliza

                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Texto com informações
                            Positioned(
                              bottom: 20,
                              left: 25,
                              child: Text(
                                item['titulo']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  shadows: [Shadow(blurRadius: 5, color: Colors.black)],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                )


              ],
            ),
          ],
        ),
      )
    );
  }
}