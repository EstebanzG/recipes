import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/data/dto/recipe_detail_dto.dart';
import 'package:recipes/ui/cubit/cubit.state.dart';

import '../cubit/recipes.cubit.dart';
import '../cubit/recipes.states.dart';
import '../widget/favorite_recipes.widget.dart';
import '../widget/header.widget.dart';
import '../widget/list_recipes.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<RecipesCubit>(context).getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesCubit, RecipesState>(builder: (context, state) {
      if (state is FailureState<RecipesStateData>) {
        return const Scaffold(
          body: Center(
            child: Text('Error occurred!'),
          ),
        );
      }

      List<RecipeDetailDto> recipes = [];
      if (state is SuccessState<RecipesStateData>) {
        recipes = state.data.recipes;
      }

      return Scaffold(
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(children: [
              const Header(),
              FavoriteRecipes(recipes: recipes),
              ListRecipes(recipes: recipes)
            ]),
          ),
        ),
      );
    });
  }
}
