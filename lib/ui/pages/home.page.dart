import 'package:flutter/material.dart';
import 'package:recipes/data/database/database.dart';
import 'package:recipes/src/services/recipe_service.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
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
      body: SafeArea(
          bottom: false,
          child: Placeholder()
      ),
    );
  }
}
