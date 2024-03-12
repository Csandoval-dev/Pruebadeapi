import 'package:flutter/material.dart'; 

// Widget para representar una barra de búsqueda
class SearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged; // Función llamada cuando cambia el texto de búsqueda

  const SearchBar({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row( // Widget Row para alinear los elementos horizontalmente
      children: [
        Expanded( // Widget Expanded para ocupar todo el espacio disponible
          child: TextField( // Widget TextField para ingresar el texto de búsqueda
            onChanged: onChanged, // Llama a la función onChanged cuando cambia el texto
            decoration: InputDecoration(hintText: 'Search...'), // Decoración del campo de texto con un texto de sugerencia
          ),
        ),
        IconButton( // Botón de búsqueda
          icon: Icon(Icons.search), // Icono de búsqueda
          onPressed: () {}, // Acción al presionar el botón de búsqueda (en este caso, no realiza ninguna acción)
        ),
      ],
    );
  }
}
