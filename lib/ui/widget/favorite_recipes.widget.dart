import 'package:flutter/material.dart';
import 'package:recipes/data/database/database.dart';

import 'meal_card.widget.dart';

class FavoriteRecipes extends StatelessWidget {

  final List<RecipeData> recipes;

  const FavoriteRecipes({
    super.key,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Explore tes recettes ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: 'favorites',
                style: TextStyle(
                  color: Color(0xFFD52A2A),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: ' ❤️️',
                style: TextStyle(
                  color: Color(0xFFD52929),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recipes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                  children: [
                    MealCard(recipe: recipes[index]),
                    const SizedBox(width: 20)
                  ]);
                },
              )))
    ]);
  }
}
