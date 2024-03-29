import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petit_chef/ui/cubit/recipes.cubit.dart';
import 'package:petit_chef/ui/cubit/recipes.states.dart';
import 'package:petit_chef/ui/pages/home.page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Petit Chef',
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
        dialogBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
          providers: [
            BlocProvider<RecipesCubit>(
              create: (BuildContext context) => RecipesCubit(),
            ),
          ],
          child: BlocBuilder<RecipesCubit, RecipesState>(
              builder: (BuildContext context, RecipesState state) {
            return const HomePage();
          })));
}
