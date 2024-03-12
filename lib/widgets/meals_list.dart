import 'package:flutter/material.dart'; 
import 'package:prueba_2/models/meal.dart'; 
import 'meal_card.dart'; // Importa el widget de MealCard
// Widget para representar una lista de comidas
class MealsList extends StatelessWidget {
  final List<Meal> meals; // Lista de comidas a mostrar en la lista

  const MealsList({Key? key, required this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder( // ListView.builder para construir la lista de comidas de manera eficiente
      itemCount: meals.length, // Número de elementos en la lista
      itemBuilder: (context, index) { // Constructor de elementos de la lista
        final meal = meals[index]; // Obtener la comida en la posición actual
        return MealCard(meal: meal); // Devolver un widget MealCard con la comida correspondiente
      },
    );
  }
}
