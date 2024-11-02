import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
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
        iconTheme: IconThemeData(
          color: Colors.white, // Cambia este color a tu preferencia
        ),
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
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '$total',
              style: TextStyle(fontSize: 40, color: Colors.yellow),
            ),
            SizedBox(height: 20),
            // Fila 1 con Contador 1 y Contador 2
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildContador("Contador1", contadores[0], 0),
                SizedBox(width: 20), // Espacio entre los contadores
                buildContador("Contador2", contadores[1], 1),
              ],
            ),
            Divider(color: Colors.grey),
            // Fila 2 con Contador 3 y Contador 4
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildContador("Contador3", contadores[2], 2),
                SizedBox(width: 20), // Espacio entre los contadores
                buildContador("Contador4", contadores[3], 3),
              ],
            ),
            Divider(color: Colors.grey),
            // Fila 3 con Contador 5 ocupando ambas columnas
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: buildContador("Contador5", contadores[4], 4),
                  ),
                ),
              ],
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

  // Método para crear el widget de cada contador
  Widget buildContador(String titulo, int contador, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          titulo,
          style: TextStyle(fontSize: 20, color: Colors.yellow),
        ),
        SizedBox(height: 4), // Espacio reducido entre título y valor
        Text(
          '$contador',
          style: TextStyle(fontSize: 12, color: Colors.yellow),
        ),
        ElevatedButton(
          onPressed: () => aumentarContador(index),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Color de fondo azul
            padding: EdgeInsets.zero, // Elimina el padding interno
            minimumSize: Size(0,0), // Tamaño mínimo ( para Elevatedbutton para que no se 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2), // Borde rectangular
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
