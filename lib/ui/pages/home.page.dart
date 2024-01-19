import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/ui/cubit/cubit.state.dart';

import '../cubit/recipes.cubit.dart';
import '../cubit/recipes.states.dart';
import '../widget/favorite_recipes.widget.dart';
import '../widget/header.widget.dart';
import '../widget/others_recipes.widget.dart';

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
    return BlocBuilder<RecipesCubit, RecipesState>(
        builder: (context, state) {
          if (state is SuccessState<RecipesStateData>) {
            return Scaffold(
              body: SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                  child: Column(children: [
                    const Header(),
                    FavoriteRecipes(recipes: state.data.recipes),
                    OtherRecipes(recipes: state.data.recipes)
                  ]),
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: Text('Error occurred!'),
              ),
            );
          }
        });
  }
}
