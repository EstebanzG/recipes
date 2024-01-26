import 'package:petit_chef/data/dto/recipe_detail_dto.dart';

import '../../data/database/database.dart';
import '../../data/dto/ingredient_detail_dto.dart';

abstract class IIngredientRepository {
  Future<List<IngredientData>> getAll();

  Future<void> insert(IngredientDetailDto ingredient, int recipeId);

  Future<void> updateAll(List<IngredientDetailDto> recipes, int idRecipe);

  Future<int> deleteAllIngredientFromRecipe(RecipeDetailDto recipeDetailDto);

  void deleteAll(List<IngredientDetailDto> ingredients);
}
