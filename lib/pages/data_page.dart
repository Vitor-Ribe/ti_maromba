import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}
class _DataPageState extends State<DataPage> {

  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  String resultado = '';
  String classificacao = '';

  void calcularImc() {
    final pesoText = pesoController.text;
    final alturaText = alturaController.text;

    if (alturaText.isEmpty || pesoText.isEmpty) {
      setState(() {
        resultado = 'Preencha os dados corretamente.';
        classificacao = '';
      });
      return;
    }

    // Verifica se altura tem ponto ou vírgula
    if (!alturaText.contains('.') && !alturaText.contains(',')) {
      // Tenta converter para int pra ver se é "180" ou maior
      final alturaInt = int.tryParse(alturaText);
      if (alturaInt != null && alturaInt > 30) {
        setState(() {
          resultado = 'Adicione a altura no formato adequado (ex: 1.70)';
          classificacao = '';
        });
        return;
      }
    }

    // Troca vírgula por ponto pra aceitar "1,70"
    final alturaStr = alturaText.replaceAll(',', '.');

    final peso = double.tryParse(pesoText);
    final altura = double.tryParse(alturaStr);

    if (peso == null || altura == null || altura == 0) {
      setState(() {
        resultado = 'Preencha os dados corretamente.';
        classificacao = '';
      });
      return;
    }

    final imc = peso / (altura * altura);
    String classif;

    if (imc < 18.5) {
      classif = 'Abaixo do peso';
    } else if (imc < 25) {
      classif = 'Peso normal';
    } else if (imc < 30) {
      classif = 'Sobrepeso';
    } else {
      classif = 'Obesidade';
    }

    setState(() {
      resultado = imc.toStringAsFixed(2);
      classificacao = classif;
    });
  }


  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              // Banner do IMC
                child: Container(
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [Colors.blue.shade700, Colors.lightBlueAccent.shade100],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      )
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          resultado.isEmpty ? 'IMC' : resultado,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: resultado.isEmpty ? 70 : 30),
                        ),
                        if (classificacao.isNotEmpty)
                          Text(
                            classificacao,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                      ],
                    ),
                  ),
                )
            ),

            SizedBox(height: 40),

            // Peso
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  'Peso',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 20)
              ),
            ),

            SizedBox(height: 10),

            // caixa de entrada para peso
            TextField(
                controller: pesoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Digite seu peso aqui (Kg)',
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey.shade500),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.blueGrey, width: 2),
                  ),
                  prefixIcon: Icon(Icons.monitor_weight_outlined, color: Colors.blueGrey),
                )
            ),

            SizedBox(height: 20),

            // Altura
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  'Altura',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 20)
              ),
            ),

            SizedBox(height: 10),

            // Caixa de entrada para altura
            TextField(
                controller: alturaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Digite sua altura aqui (Kg)',
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey.shade500),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.blueGrey, width: 2),
                  ),
                  prefixIcon: Icon(Icons.accessibility_outlined, color: Colors.blueGrey),
                )
            ),

            SizedBox(height: 80),

            Center(
              child: ElevatedButton(
                onPressed: calcularImc,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text('Calcular', style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          ],
        ),
      )
  );
}