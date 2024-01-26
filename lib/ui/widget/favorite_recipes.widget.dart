import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petit_chef/data/dto/recipe_detail_dto.dart';

import '../../src/services/recipe_service.dart';
import '../cubit/recipes.cubit.dart';
import 'recipe_card.widget.dart';

class FavoriteRecipes extends StatefulWidget {
  final List<RecipeDetailDto> recipes;

  const FavoriteRecipes({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  State<FavoriteRecipes> createState() => _FavoriteRecipesState();
}

class _FavoriteRecipesState extends State<FavoriteRecipes> {
  final RecipeService recipeService = RecipeService();
  late List<RecipeDetailDto> favoriteRecipes = [];

  @override
  void initState() {
    super.initState();
    _updateFavoriteRecipes();
  }

  @override
  void didUpdateWidget(covariant FavoriteRecipes oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.recipes != oldWidget.recipes) {
      _updateFavoriteRecipes();
    }
  }

  void _updateFavoriteRecipes() {
    setState(() {
      favoriteRecipes = recipeService.filterRecipesByFavorite(widget.recipes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeaderText(),
        favoriteRecipes.isEmpty
            ? const Text("Vous n'avez aucune recette favorite 😞")
            : _buildRecipesList(),
      ],
    );
  }

  Widget _buildHeaderText() {
    return const Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Explorez vos recettes ',
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
    );
  }

  Widget _buildRecipesList() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: favoriteRecipes.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                RecipeCard(
                  recipe: favoriteRecipes[index],
                  recipesCubit: BlocProvider.of<RecipesCubit>(context),
                ),
                const SizedBox(width: 40),
              ],
            );
          },
        ),
      ),
    );
  }
}