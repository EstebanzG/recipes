import 'package:flutter/material.dart';
import 'package:recipes/data/database/database.dart';
import 'package:recipes/src/services/recipe_service.dart';

import '../widget/favorite_recipes.widget.dart';
import '../widget/header.widget.dart';
import '../widget/others_recipes.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RecipeService recipeService = RecipeService();
  List<RecipeData> recipes = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    isLoading = true;
    List<RecipeData> recipesFromDb = await recipeService.getAllRecipes();
    isLoading = false;
    setState(() {
      recipes = recipesFromDb;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: Icon(
        Icons.add_circle_outline,
        color: Colors.black,
        size: 35.0,
        semanticLabel: 'add new recipe',
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child:
              Column(children: [Header(), FavoriteRecipes(), OtherRecipes()]),
        ),
      ),
    );
  }
}
