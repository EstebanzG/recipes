import 'package:flutter/material.dart';
import 'package:recipes/data/dto/ingredient_detail_dto.dart';
import 'package:share_plus/share_plus.dart';

import '../../data/dto/recipe_detail_dto.dart';
import '../../src/services/recipe_service.dart';
import '../cubit/recipes.cubit.dart';

class DetailInformation extends StatefulWidget {
  final RecipeDetailDto recipe;
  final RecipesCubit recipesCubit;

  const DetailInformation({
    Key? key,
    required this.recipe,
    required this.recipesCubit,
  }) : super(key: key);

  @override
  State<DetailInformation> createState() => _DetailInformationState();
}

class _DetailInformationState extends State<DetailInformation> {
  final RecipeService recipeService = RecipeService();
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.recipe.favorite;
  }

  void manageFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    widget.recipe.favorite = isFavorite;
    widget.recipesCubit.updateExistingRecipe(widget.recipe);
    recipeService.updateRecipe(widget.recipe);
  }

  void shareRecipe() {
    Share.share(widget.recipe.toString());
  }

  Widget buildInfoItem(IconData icon, String text) {
    return Flex(
      direction: Axis.vertical,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: Colors.black,
            size: 35.0,
            semanticLabel: text,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget buildActionItem(IconData icon, String label, Function() onPressed) {
    return Flex(
      direction: Axis.vertical,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.black,
            size: 35.0,
            semanticLabel: label,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget buildIngredientsList(List<IngredientDetailDto> ingredients) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Ingrédients :',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
        for (var ingredient in ingredients)
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
    );
  }

  Widget buildDescription(String description) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Description :',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
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
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: widget.recipe.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (widget.recipe.category != "")
                        TextSpan(
                          text: " - ${widget.recipe.category}",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    ],
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
              buildInfoItem(
                  Icons.timer_outlined, '${widget.recipe.duration} minutes'),
              buildActionItem(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                isFavorite ? 'Supprimer des favoris' : 'Ajouter aux favoris',
                manageFavorite,
              ),
              buildActionItem(Icons.share, 'Partager', shareRecipe),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          buildIngredientsList(widget.recipe.ingredients),
          const SizedBox(
            height: 15,
          ),
          buildDescription(widget.recipe.description),
        ],
      ),
    );
  }
}
