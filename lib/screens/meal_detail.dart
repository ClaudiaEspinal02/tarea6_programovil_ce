import 'package:flutter/material.dart';
import '../models/meal_model.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailScreen({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.strMeal),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(meal.strMealThumb),
            SizedBox(height: 8),
            Text('Category: ${meal.strCategory}'),
            SizedBox(height: 8),
            Text('Area: ${meal.strArea}'),
            SizedBox(height: 8),
            Text('Instructions:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(meal.strInstructions),
          ],
        ),
      ),
    );
  }
}
