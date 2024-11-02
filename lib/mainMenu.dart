import 'package:flutter/material.dart';


class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Menu -  Desafio 02 - ContadorApp')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/page1'),
              child: Text('Go to - Propuesta 01'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/page2'),
              child: Text('Go to - Propuesta 02'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/page3'),
              child: Text('Go to - Propuesta 03'),
            ),
          ],
        ),
      ),
    );
  }
}
