
import 'dart:convert'; // Para decodificar datos JSON
import 'package:http/http.dart' as http; // Para realizar solicitudes HTTP

// Clase que proporciona métodos para interactuar con la API de comidas
class ApiClient {
  // URL base de la API
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  // Método para obtener comidas por categoría
  Future<dynamic> getMeals() async {
    // Realizar una solicitud GET para obtener comidas filtradas por categoría 'Seafood'
    final response = await http.get(Uri.parse('$baseUrl/filter.php?c=Seafood'));

    // Verificar si la solicitud fue exitosa (código de estado 200)
    if (response.statusCode == 200) {
      // Decodificar el cuerpo de la respuesta JSON y devolverlo
      return jsonDecode(response.body);
    } else {
      // Si la solicitud no fue exitosa, lanzar una excepción con un mensaje de error
      throw Exception('Failed to load meals');
    }
  }

  // Método para buscar comidas por nombre
  Future<dynamic> searchMeals(String query) async {
    // Realizar una solicitud GET para buscar comidas que coincidan con la consulta
    final response = await http.get(Uri.parse('$baseUrl/search.php?s=$query'));

    // Verificar si la solicitud fue exitosa (código de estado 200)
    if (response.statusCode == 200) {
      // Decodificar el cuerpo de la respuesta JSON y devolverlo
      return jsonDecode(response.body);
    } else {
      // Si la solicitud no fue exitosa, lanzar una excepción con un mensaje de error
      throw Exception('Failed to search meals');
    }
  }
}
