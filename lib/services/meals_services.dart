import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/meal_model.dart';

class MealService {
  static const String _baseUrl = "https://www.themealdb.com/api/json/v1/1";

  Future<List<Meal>> fetchMeals() async {
    final response = await http.get(Uri.parse("$_baseUrl/search.php?s="));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> mealsJson = data['meals'];
      return mealsJson.map((json) => Meal.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }
}
