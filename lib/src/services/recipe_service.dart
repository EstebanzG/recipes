import 'package:recipes/src/repositories/recipe_repository.dart';

import '../../data/database/database.dart';

class RecipeService {
  RecipeRepository recipeRepository = RecipeRepository();

  Future<List<RecipeData>> getAllRecipes() {
    return recipeRepository.getAll();
  }}