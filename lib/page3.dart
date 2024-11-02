import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu Principal - Desafio 02 - ContadorApp",
          style: TextStyle(fontSize: 15, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ContadoresApp(),
    );
  }
}

class ContadoresApp extends StatefulWidget {
  @override
  _ContadoresAppState createState() => _ContadoresAppState();
}

class _ContadoresAppState extends State<ContadoresApp> {
  List<int> contadores = List<int>.filled(5, 0);

  int get total => contadores.reduce((a, b) => a + b);

  void reset() {
    setState(() {
      contadores = List<int>.filled(5, 0);
    });
  }

  void aumentarContador(int index) {
    setState(() {
      contadores[index]++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '$total',
              style: TextStyle(fontSize: 40, color: Colors.yellow),
            ),
            SizedBox(height: 20),

            // Filas de contadores con divisores
            ContadorRow(
              contadores: contadores,
              index1: 0,
              index2: 1,
              onIncrement: aumentarContador,
            ),
            Divider(color: Colors.grey, thickness: 1, height: 20),

            ContadorRow(
              contadores: contadores,
              index1: 2,
              index2: 3,
              onIncrement: aumentarContador,
            ),
            Divider(color: Colors.grey, thickness: 1, height: 20),

            // Último contador centrado
            ContadorWidget(
              title: "Contador5",
              count: contadores[4],
              onIncrement: () => aumentarContador(4),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: reset,
        backgroundColor: Colors.red,
        child: Text(
          "RESET",
          style: TextStyle(fontSize: 15, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        shape: CircleBorder(),
      ),
    );
  }
}

// Widget para cada contador
class ContadorWidget extends StatelessWidget {
  final String title;
  final int count;
  final VoidCallback onIncrement;

  ContadorWidget({required this.title, required this.count, required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 30, color: Colors.yellow),
        ),
        // SizedBox(height: -2),
        Text(
          '$count',
          style: TextStyle(fontSize: 15, color: Colors.yellow),
        ),
        ElevatedButton(
          onPressed: onIncrement,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            // padding: EdgeInsets.zero,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            minimumSize: Size(0, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          child: Text(
            "add",
            style: TextStyle(fontSize: 15, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

// Widget para una fila de dos contadores
class ContadorRow extends StatelessWidget {
  final List<int> contadores;
  final int index1;
  final int index2;
  final Function(int) onIncrement;
  final double widgetWidth; // Define el ancho deseado para cada widget
  final double spacing; // Espaciado entre widgets

  ContadorRow({
    required this.contadores,
    required this.index1,
    required this.index2,
    required this.onIncrement,
    this.widgetWidth = 160.0, // Valor predeterminado del ancho
    this.spacing = 60.0, // Valor predeterminado del espaciado entre widgets
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: widgetWidth, // Define el ancho del primer ContadorWidget
          child: ContadorWidget(
            title: "Contador${index1 + 1}",
            count: contadores[index1],
            onIncrement: () => onIncrement(index1),
          ),
        ),
        SizedBox(width: spacing), // Espacio ajustable entre los dos contadores
        SizedBox(
          width: widgetWidth, // Define el ancho del segundo ContadorWidget
          child: ContadorWidget(
            title: "Contador${index2 + 1}",
            count: contadores[index2],
            onIncrement: () => onIncrement(index2),
          ),
        ),
      ],
    );
  }
}