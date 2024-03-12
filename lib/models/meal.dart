class Meal {
  // Propiedades de la clase Meal
  final String id; // ID del plato de comida
  final String name; // Nombre del plato de comida
  final String category; // Categoría del plato de comida
  final String area; // Área o región del plato de comida
  final String instructions; // Instrucciones para preparar el plato de comida
  final String thumb; // URL de la imagen en miniatura del plato de comida

  // Constructor de la clase Meal
  Meal({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.thumb,
  });

  // Constructor de fábrica para crear una instancia de Meal a partir de datos JSON
  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'], // Asigna el valor de 'idMeal' del JSON a la propiedad 'id'
      name: json['strMeal'], // Asigna el valor de 'strMeal' del JSON a la propiedad 'name'
      category: json['strCategory'], // Asigna el valor de 'strCategory' del JSON a la propiedad 'category'
      area: json['strArea'], // Asigna el valor de 'strArea' del JSON a la propiedad 'area'
      instructions: json['strInstructions'], // Asigna el valor de 'strInstructions' del JSON a la propiedad 'instructions'
      thumb: json['strMealThumb'], // Asigna el valor de 'strMealThumb' del JSON a la propiedad 'thumb'
    );
  }
}
