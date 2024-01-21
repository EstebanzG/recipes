import '../../data/database/database.dart';
import '../../data/dto/ingredient_detail_dto.dart';

abstract class IIngredientRepository {
  Future<List<IngredientData>> getAll();
  Future<List<IngredientData>>? getByRecipeId(int id);
  Future<void> insert(IngredientData ingredientData);
  Future<void> updates(List<IngredientDetailDto> recipes, int idRecipe);
  Future<void> delete(int id);
}