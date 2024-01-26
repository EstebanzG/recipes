import 'package:recipes/data/dto/recipe_detail_dto.dart';

import '../../data/database/database.dart';
import '../../data/dto/ingredient_detail_dto.dart';
import '../repositories/ingredient_repository.dart';

class IngredientService {
  IngredientRepository ingredientRepository = IngredientRepository();

  Future<List<IngredientData>> getAllIngredients() async {
    return await ingredientRepository.getAll();
  }

  Future<List<IngredientData>> getIngredientsByRecipeId(int recipeId) async {
    return await ingredientRepository.getIngredientsByRecipeId(recipeId);
  }

  void insertAll(List<IngredientDetailDto> ingredients, int recipeId) {
    ingredientRepository.insertAll(ingredients, recipeId);
  }

  void updateAll(List<IngredientDetailDto> ingredients, int recipeId) {
    ingredientRepository.updateAll(ingredients, recipeId);
  }

  void deleteAllIngredientFromRecipe(RecipeDetailDto recipe) {
    ingredientRepository.deleteAllIngredientFromRecipe(recipe);
  }

  void deleteAll(List<IngredientDetailDto> ingredients) {
    ingredientRepository.deleteAll(ingredients);
  }
}
