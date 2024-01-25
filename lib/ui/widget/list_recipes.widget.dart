import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/data/dto/recipe_detail_dto.dart';
import 'package:recipes/src/services/recipe_service.dart';

import '../cubit/recipes.cubit.dart';
import 'recipe_card.widget.dart';

class ListRecipes extends StatefulWidget {
  final List<RecipeDetailDto> recipes;

  const ListRecipes({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  State<ListRecipes> createState() => _ListRecipesState();
}

class _ListRecipesState extends State<ListRecipes> {
  final TextEditingController searchBarController = TextEditingController();
  final RecipeService recipeService = RecipeService();
  late List<RecipeDetailDto> filteredRecipes;
  String selectedCategory = "";

  @override
  void initState() {
    super.initState();
    filteredRecipes = widget.recipes;
  }

  @override
  void didUpdateWidget(covariant ListRecipes oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.recipes != oldWidget.recipes) {
      reloadFilteredRecipes();
    }
  }

  void reloadFilteredRecipes() {
    setState(() {
      filteredRecipes = recipeService.getAllRecipesByNameAndCategory(
          widget.recipes, searchBarController.text, selectedCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        _buildSearchBar(),
        _buildCategoryChips(),
        _buildRecipesGrid(),
      ],
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.only(top: 20, bottom: 10),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Ou cherchez parmi vos ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'autres recettes',
                  style: TextStyle(
                    color: Color(0xFF6A736C),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: ' 🔎️️',
                  style: TextStyle(
                    color: Color(0xFFD52929),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return SizedBox(
      width: 350,
      height: 50,
      child: TextFormField(
        controller: searchBarController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Tarte à la tomate',
          labelText: 'Rechercher',
        ),
        cursorColor: Colors.black,
        onChanged: (_) {
          reloadFilteredRecipes();
        },
      ),
    );
  }

  Widget _buildCategoryChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (var category in RecipeDetailDto.CATEGORIES)
            ActionChip(
              label: Text(category),
              onPressed: () {
                if (category != selectedCategory) {
                  selectedCategory = category;
                } else {
                  selectedCategory = "";
                }
                reloadFilteredRecipes();
              },
              backgroundColor:
                  selectedCategory == category ? Colors.grey.shade400 : null,
            ),
        ],
      ),
    );
  }

  Widget _buildRecipesGrid() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: filteredRecipes.length,
        itemBuilder: (context, index) {
          return SizedBox(
            child: RecipeCard(
              recipe: filteredRecipes[index],
              recipesCubit: BlocProvider.of<RecipesCubit>(context),
            ),
          );
        },
      ),
    );
  }
}
