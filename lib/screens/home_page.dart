import 'package:flutter/material.dart';
import '../services/meal_service.dart';
import '../models/meal_model.dart';
import 'meal_detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MealService _mealService = MealService();
  late Future<List<Meal>> meals;

  @override
  void initState() {
    super.initState();
    meals = _mealService.fetchMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MealDB'),
      ),
      body: FutureBuilder<List<Meal>>(
        future: meals,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No meals found'));
          }

          final meals = snapshot.data!;

          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return ListTile(
                title: Text(meal.strMeal),
                subtitle: Text(meal.strCategory),
                leading: Image.network(meal.strMealThumb),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MealDetailScreen(meal: meal),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
