import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

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
  late bool isFavorite = false;
  IconData favoriteIcon = Icons.favorite_border;

  @override
  void initState() {
    super.initState();
    setState(() {
      isFavorite = widget.recipe.favorite;
    });
  }

  void manageFavorite() {
    widget.recipe.favorite = !widget.recipe.favorite;
    setState(() {
      isFavorite = widget.recipe.favorite;
    });
    widget.recipesCubit.updateExistingRecipe(widget.recipe);
    recipeService.updateRecipe(widget.recipe);
  }

  void shareRecipe() {
    Share.share(widget.recipe.toString());
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
              SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: Text(
                  widget.recipe.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
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
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.timer_outlined,
                      color: Colors.black,
                      size: 35.0,
                      semanticLabel: 'temps de réalisation',
                    ),
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
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.black,
                      size: 35.0,
                      semanticLabel: isFavorite
                          ? 'Supprimer des favoris'
                          : 'Ajouter aux favoris',
                    ),
                  ),
                  Text(
                    isFavorite
                        ? 'Supprimer des favoris'
                        : 'Ajouter aux favoris',
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
                      shareRecipe();
                    },
                    icon: const Icon(
                      Icons.share,
                      color: Colors.black,
                      size: 35.0,
                      semanticLabel: 'partager',
                    ),
                  ),
                  const Text(
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
            height: 15,
          ),
          Column(
            children: [
              Row(children: [
                Text(
                  'Ingrédients :',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.grey.shade800
                  ),
                ),
              ]),
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
            height: 15,
          ),
          Row(
            children: [
              Text(
                'Description :',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.grey.shade800
                ),
              ),
            ],
          ),
          Row(
            children: [
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
          )
        ],
      ),
    );
  }
}
