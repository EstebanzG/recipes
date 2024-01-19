import 'package:flutter/material.dart';
import 'package:recipes/data/database/database.dart';

import '../pages/detail.page.dart';

class MealCard extends StatelessWidget {

  final RecipeData recipe;

  const MealCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(recipe: recipe)),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 100),
                borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            height: 150,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                  recipe.title
              ),
            ),
          )
        ],

      ),
    );
  }
}