import 'package:flutter/material.dart'; 
import 'package:prueba_2/views/meals_page.dart'; 

void main() {
  runApp(const MyApp()); // Inicia la aplicación
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor de MyApp

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Widget MaterialApp para la aplicación Flutter
      title: 'Flutter Demo', // Título de la aplicación
      theme: ThemeData( // Tema de la aplicación
        primarySwatch: Colors.blue, // Color principal de la aplicación
      ),
      home: const MealsPage(), // Página inicial de la aplicación
    );
  }
}
