import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/data/dto/recipe_detail_dto.dart';
import 'package:recipes/src/services/recipe_service.dart';

import '../cubit/recipes.cubit.dart';
import 'recipe_card.widget.dart';

class OtherRecipes extends StatefulWidget {
  final List<RecipeDetailDto> recipes;

  const OtherRecipes({
    super.key,
    required this.recipes,
  });

  @override
  State<OtherRecipes> createState() => _OtherRecipesState();
}

class _OtherRecipesState extends State<OtherRecipes> {
  final TextEditingController searchBarController = TextEditingController();
  final RecipeService recipeService = RecipeService();
  late List<RecipeDetailDto> filteredRecipes = [];

  @override
  void initState() {
    super.initState();
    filteredRecipes = widget.recipes;
  }

  @override
  void didUpdateWidget(covariant OtherRecipes oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.recipes != oldWidget.recipes) {
      reloadFilteredRecipes(searchBarController.text);
    }
  }

  void reloadFilteredRecipes(String name) {
    setState(() {
      filteredRecipes = recipeService.getAllRecipesByName(widget.recipes, name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Ou cherche parmi tes ',
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
        ),
        SizedBox(
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
                labelText: 'Rechercher'),
            cursorColor: Colors.black,
            onChanged: (String searchValue) {
              reloadFilteredRecipes(searchValue);
            },
          ),
        ),
        Padding(
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
        ),
      ],
    );
  }
}
