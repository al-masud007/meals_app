import 'package:flutter/material.dart';
import 'package:meals/Screens/meal_details_screen.dart';
import 'package:meals/models/meal.dart';

import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;
  void selectedMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MealDetailsScreen(meal: meal)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemBuilder: (ctx, index) => Text(meals[index].title),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Opppsss .... Nothing here !',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Try Diffrent Category !',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      );
    }

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectmeal: (meal) => selectedMeal(ctx, meal),
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
