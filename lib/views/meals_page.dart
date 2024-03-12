
import 'package:flutter/material.dart'; 
import 'package:prueba_2/models/meal.dart'; // Importa el modelo de comida
import 'package:prueba_2/services/api_client.dart'; // Importa el cliente de la API
import 'package:prueba_2/widgets/meals_list.dart'; // Importa el widget de la lista de comidas

// Página para mostrar una lista de comidas
class MealsPage extends StatefulWidget {
  const MealsPage({Key? key}) : super(key: key);

  @override
  _MealsPageState createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  // Instancia del cliente de la API
  late ApiClient _apiClient;
  // Controlador para el campo de búsqueda
  late TextEditingController _searchController;
  // Lista de comidas
  List<Meal> _meals = [];

  @override
  void initState() {
    super.initState();
    // Inicialización del cliente de la API y el controlador del campo de búsqueda
    _apiClient = ApiClient();
   
    _searchController = TextEditingController();
    // Cargar las comidas al iniciar la página
    _loadMeals();
  }

  // Método para cargar las comidas desde la API
  Future<void> _loadMeals() async {
    try {
      final result = await _apiClient.getMeals();
      final meals = (result['meals'] as List)
          .map((json) => Meal.fromJson(json))
          .toList();
      setState(() {
        _meals = meals;
      });
    } catch (e) {
      print(e);
    }
  }

  // Método para buscar comidas según un término de búsqueda
  Future<void> _searchMeals() async {
    try {
      final query = _searchController.text;
      if (query.isNotEmpty) {
        final result = await _apiClient.searchMeals(query);
        final meals = (result['meals'] as List)
            .map((json) => Meal.fromJson(json))
            .toList();
        setState(() {
          _meals = meals;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'), // Título de la página
        actions: [
          // Acciones de la barra de navegación
          IconButton(
            icon: Icon(Icons.refresh), // Icono para recargar las comidas
            onPressed: _loadMeals, // Llama al método para cargar las comidas
          ),
          // Widget de la barra de búsqueda
          SearchBar(onChanged: (query) {
            _searchController.text = query;
            _searchMeals();
          }),
        ],
      ),
      // Cuerpo de la página, muestra una lista de comidas o un indicador de carga
      body: _meals.isEmpty
          ? Center(
              child: CircularProgressIndicator(), // Indicador de carga
            )
          : MealsList(meals: _meals), // Lista de comidas
    );
  }

  @override
  void dispose() {
    // Liberar recursos cuando se destruye la página
    _searchController.dispose(); // Dispose del controlador del campo de búsqueda
    super.dispose();
  }
}
