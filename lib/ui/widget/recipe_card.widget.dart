import 'package:flutter/material.dart';
import 'package:recipes/data/dto/recipe_detail_dto.dart';

import '../cubit/recipes.cubit.dart';
import '../pages/detail.page.dart';

class RecipeCard extends StatelessWidget {
  final RecipeDetailDto recipe;
  final RecipesCubit recipesCubit;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.recipesCubit,
  });

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
                  )),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            height: 200,
            width: 175,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 175,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 100),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                //todo
                              },
                              icon: const Icon(
                                Icons.delete_forever_outlined,
                                color: Colors.white,
                                size: 20.0,
                                semanticLabel: 'delete recipe',
                              ))
                        ],
                      ),
                    )
                  ],
                ),
                Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(recipe.title),
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.timer_outlined,
                        ),
                        Text(recipe.duration.toString()),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
