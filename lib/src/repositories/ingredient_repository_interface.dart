import 'package:recipes/data/dto/recipe_detail_dto.dart';

import '../../data/database/database.dart';
import '../../data/dto/ingredient_detail_dto.dart';

abstract class IIngredientRepository {
  Future<List<IngredientData>> getAll();
  Future<List<IngredientData>>? getByRecipeId(int id);
  Future<void> insert(IngredientData ingredientData);
  Future<void> updates(List<IngredientDetailDto> recipes, int idRecipe);
  Future<int> deleteAllIngredientFromRecipe(RecipeDetailDto recipeDetailDto);
  void deleteAll(List<IngredientDetailDto> ingredients);
  }