import '../../data/database/database.dart';
import '../../data/dto/recipe_detail_dto.dart';

abstract class IRecipeRepository {
  Future<List<RecipeData>> getAll();
  Future<RecipeData?> getOne(int id);
  Future<void> insert(RecipeData recipeData);
  Future<void> update(RecipeDetailDto recipe);
  Future<void> delete(int id);
  Future<void> insertRecipeWithIngredients(RecipeDetailDto recipe);
}