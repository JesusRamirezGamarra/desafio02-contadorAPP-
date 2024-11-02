import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
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
    // return MaterialApp(
    //   home: ContadoresApp(),
    // );
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
  // Generar filas de contadores usando un `for`
            for (int i = 0; i < contadores.length; i++)
              if (i < 4)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Si el índice es impar, omite la primera columna y solo agrega un contador
                    if (i % 2 == 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildContador("Contador ${i + 1}", contadores[i], i),
                          SizedBox(width: 20), // Espacio entre contadores
                          buildContador("Contador ${i + 2}", contadores[i + 1], i + 1),
                        ],
                      ),                    
                        // Agregar Divider después de cada fila de dos contadores, excepto la última
                      // if (i < 2) 
                      //   Divider(color: Colors.grey, height: 20),
                    // if (i % 2 == 0) ...[
                    //   buildContador("Contador ${i + 1}", contadores[i], i),
                    //   SizedBox(width: 20), // Espacio entre contadores
                    //   buildContador("Contador ${i + 2}", contadores[i + 1], i + 1),
                    // ],
                  ],
                )
              else
                // Fila 3 con Contador 5 centrado
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: buildContador("Contador ${i + 1}", contadores[i], i),
                      ),
                    ),
                  ],
                ),            
            // for (int i = 0; i < contadores.length; i++)
            //   Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 10.0),
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min, 
            //       children: [
            //         Text(
            //           'Contador${i + 1}',
            //           style: TextStyle(fontSize: 20, color: Colors.yellow),
            //         ),
            //         Text(
            //           '${contadores[i]}',
            //           style: TextStyle(fontSize: 12, color: Colors.yellow),
            //         ),
            //         ElevatedButton(
            //           onPressed: () => aumentarContador(i),
            //             style: ElevatedButton.styleFrom(
            //             backgroundColor : Colors.blue, // Color de fondo azul
            //             padding: EdgeInsets.zero, 
            //             minimumSize: Size(0,0), // Tamaño mínimo ( para Elevatedbutton para que no se expanda)
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(2), // Borde rectangular
            //             ),
                        
            //           ),
            //           // child: Text("add"),
            //           child: Text(
            //             "add",
            //             style: TextStyle(fontSize: 15, color: Colors.white), // Corrección aquí
            //             textAlign: TextAlign.center,
            //           ),
            //         ),
            //         if (i < contadores.length - 1)
            //           Divider(color: Colors.grey, height: 20),
            //       ],
            //     ),
            //   ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: reset,
        backgroundColor: Colors.red,
        child: Text(
          "RESET",
          style: TextStyle(fontSize: 15, color: Colors.white), // Corrección aquí
          textAlign: TextAlign.center,
        ),        
        // style: TextStyle(fontSize: 15, color: Colors.white),
        //child: Text("RESET", style: TextStyle(fontSize: 15,Colors.white)),
        shape: CircleBorder(),
      ),
    );
  }

  // @override
  Widget build_Estatico(BuildContext context) {
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
                buildContador("Contador1XX", contadores[0], 0),
                SizedBox(width: 20), // Espacio entre los contadores
                buildContador("Contador2", contadores[1], 1),
              ],
            ),
            //Divider(color: Colors.grey, thickness: 2, height: 30), // Divider después de Contador 1 y 2
          // Divider después de Contador 1 y 2 usando un Container
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              color: Colors.grey,
              height: 2, // Grosor de la línea divisoria
              width: MediaQuery.of(context).size.width * 0.8, // Ancho relativo al ancho de la pantalla
            ),            
            // Fila 2 con Contador 3 y Contador 4
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildContador("Contador3", contadores[2], 2),
                SizedBox(width: 20), // Espacio entre los contadores
                buildContador("Contador4", contadores[3], 3),
              ],
            ),
            // Divider después de Contador 3 y 4
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(color: Colors.grey, thickness: 2),
            ),
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
        )//,                                    
        // Divider(
        //   color: Colors.grey, // Color de la línea divisoria
        //   thickness: 1,       // Grosor de la línea
        //   height: 20,         // Altura vertical del espacio que ocupa el Divider
        // ),        
      ],
    );
  }



}
