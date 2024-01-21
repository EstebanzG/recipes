import 'package:flutter/material.dart';

import '../../data/dto/recipe_detail_dto.dart';

class DetailInformation extends StatelessWidget {
  final RecipeDetailDto recipe;

  const DetailInformation({
    super.key,
    required this.recipe,
  });

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
                recipe.title,
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
              const Flex(
                direction: Axis.vertical,
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                    size: 35.0,
                    semanticLabel: 'add to favorite',
                  ),
                  Text(
                    'Add to favorite',
                    style: TextStyle(
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
                  const Icon(
                    Icons.timer_outlined,
                    color: Colors.black,
                    size: 35.0,
                    semanticLabel: 'duration',
                  ),
                  Text(
                    '${recipe.duration} minutes',
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
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              for (var ingredient in recipe.ingredients)
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
            recipe.description,
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
