import 'package:flutter/material.dart';
import 'package:recipes/data/dto/recipe_detail_dto.dart';

import '../../src/services/recipe_service.dart';
import '../cubit/recipes.cubit.dart';
import '../pages/detail.page.dart';

class RecipeCard extends StatelessWidget {
  final RecipeService recipeService = RecipeService();
  final RecipeDetailDto recipe;
  final RecipesCubit recipesCubit;

  RecipeCard({
    Key? key,
    required this.recipe,
    required this.recipesCubit,
  }) : super(key: key);

  void deleteRecipe() {
    recipeService.deleteRecipe(recipe);
    recipesCubit.deleteRecipe(recipe);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              recipe: recipe,
              recipesCubit: recipesCubit,
            ),
          ),
        );
      },
      child: SizedBox(
        height: 200,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          width: 175,
          child: Column(
            children: [
              _buildTopContainer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(recipe.title),
                    _buildDurationRow(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopContainer() {
    return Stack(
      children: [
        Container(
          height: 100,
          width: 175,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 100),
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  deleteRecipe();
                },
                icon: const Icon(
                  Icons.delete_forever_outlined,
                  color: Colors.white,
                  size: 20.0,
                  semanticLabel: 'delete recipe',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDurationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.timer_outlined),
        Text(recipe.duration.toString()),
      ],
    );
  }
}
