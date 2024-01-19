import 'package:recipes/data/dto/recipe_detail_dto.dart';
import 'package:recipes/src/repositories/recipe_repository.dart';

import '../../data/database/database.dart';
import '../repositories/ingredient_repository.dart';

class RecipeService {
  RecipeRepository recipeRepository = RecipeRepository();
  IngredientRepository ingredientRepository = IngredientRepository();

  Future<List<RecipeData>> getAllRecipes() {
    return recipeRepository.getAll();
  }

  void createNewRecipe(RecipeDetailDto recipeDto) {
    recipeRepository.insertRecipeWithIngredients(recipeDto);
  }
}
