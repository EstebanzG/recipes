import '../../data/database/database.dart';
import '../../data/dto/recipe_detail_dto.dart';

abstract class IRecipeRepository {
  Future<List<RecipeData>> getAll();
  Future<RecipeData?> getOne(int id);
  Future<void> insert(RecipeData book);
  Future<void> update(RecipeData book);
  Future<void> delete(int id);
  Future<void> insertRecipeWithIngredients(RecipeDetailDto recipe);
}