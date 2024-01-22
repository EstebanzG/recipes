import 'package:flutter/material.dart';

import '../../data/dto/recipe_detail_dto.dart';
import '../../src/services/recipe_service.dart';
import '../cubit/recipes.cubit.dart';

class DetailInformation extends StatefulWidget {
  final RecipeDetailDto recipe;
  final RecipesCubit recipesCubit;

  const DetailInformation({
    super.key,
    required this.recipe,
    required this.recipesCubit,
  });

  @override
  State<DetailInformation> createState() => _DetailInformationState();
}

class _DetailInformationState extends State<DetailInformation> {
  final RecipeService recipeService = RecipeService();
  IconData favoriteIcon = Icons.favorite_border;

  @override
  void initState() {
    super.initState();
    setState(() {
      favoriteIcon = widget.recipe.favorite ? Icons.favorite : Icons.favorite_border;
    });
  }

  void manageFavorite() {
    widget.recipe.favorite = !widget.recipe.favorite;
    setState(() {
      favoriteIcon = widget.recipe.favorite ? Icons.favorite : Icons.favorite_border;
    });
    widget.recipesCubit.updateExistingRecipe(widget.recipe);
    recipeService.updateRecipe(widget.recipe);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.recipe.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flex(
                direction: Axis.vertical,
                children: [
                  const Icon(
                    Icons.timer_outlined,
                    color: Colors.black,
                    size: 35.0,
                    semanticLabel: 'duration',
                  ),
                  Text(
                    '${widget.recipe.duration} minutes',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Flex(
                direction: Axis.vertical,
                children: [
                  IconButton(
                    onPressed: () {
                      manageFavorite();
                    },
                    icon: Icon(
                      favoriteIcon,
                      color: Colors.black,
                      size: 35.0,
                      semanticLabel: 'add to favorite',
                    ),
                  ),
                  const Text(
                    'Add to favorite',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Flex(
                direction: Axis.vertical,
                children: [
                  Icon(
                    Icons.share,
                    color: Colors.black,
                    size: 35.0,
                    semanticLabel: 'share',
                  ),
                  Text(
                    'Partager',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              for (var ingredient in widget.recipe.ingredients)
                Row(
                  children: [
                    Text(
                      '\u2022 ${ingredient.name} - ${ingredient.quantity} ${ingredient.unit}',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.recipe.description,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
