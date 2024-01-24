import 'package:flutter/material.dart';
import 'package:recipes/data/dto/recipe_detail_dto.dart';

import '../cubit/recipes.cubit.dart';
import '../widget/detail_information.dart';
import 'form.page.dart';

class DetailPage extends StatelessWidget {
  final RecipeDetailDto recipe;
  final RecipesCubit recipesCubit;

  const DetailPage({
    super.key,
    required this.recipe,
    required this.recipesCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                Container(
                  height: 350,
                  color: const Color.fromRGBO(217, 217, 217, 100),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                          size: 35.0,
                          semanticLabel: 'back to Homepage',
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FormPage(
                                      recipe: RecipeDetailDto(
                                        recipe.idRecipe,
                                        recipe.favorite,
                                        recipe.title,
                                        recipe.description,
                                        recipe.duration,
                                        recipe.ingredients
                                      ),
                                      recipesCubit: recipesCubit,
                                    )),
                          );
                        },
                        icon: const Icon(
                          Icons.mode_edit_outline,
                          color: Colors.black,
                          size: 35.0,
                          semanticLabel: 'Modify recipe',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DetailInformation(recipe: recipe, recipesCubit: recipesCubit)
          ]),
        ),
      ),
    );
  }
}
