import 'package:flutter/material.dart'; // Importa los widgets de Flutter
import 'package:prueba_2/models/meal.dart'; // Importa el modelo de comida

// Widget para representar un card de comida
class MealCard extends StatelessWidget {
  final Meal meal; // Instancia de Meal que representa la comida a mostrar en el card

  const MealCard({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card( // Widget Card para representar el card de comida
      child: Column( // Columna para organizar los elementos del card
        crossAxisAlignment: CrossAxisAlignment.stretch, // Alineación de los elementos al inicio
        children: [
          Image.network(meal.thumb, height: 200), // Imagen de la comida
          ListTile( // ListTile para mostrar el nombre, categoría y área de la comida
            title: Text(meal.name), // Título con el nombre de la comida
            subtitle: Text('${meal.category} - ${meal.area}'), // Subtítulo con la categoría y área de la comida
            trailing: IconButton( // Botón de favorito
              icon: const Icon(Icons.favorite_border), // Icono del botón
              onPressed: () {}, // Acción al presionar el botón (en este caso, no realiza ninguna acción)
            ),
          ),
          Padding( // Padding para añadir espacio alrededor del texto de las instrucciones
            padding: const EdgeInsets.all(8.0), // Espacio de 8.0 en todos los lados
            child: Text(meal.instructions), // Texto con las instrucciones de la comida
          ),
        ],
      ),
    );
  }
}
