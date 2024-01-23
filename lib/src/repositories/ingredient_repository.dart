import 'package:drift/drift.dart';
import 'package:recipes/data/database/database.dart';
import 'package:recipes/data/dto/ingredient_detail_dto.dart';
import 'package:recipes/data/dto/recipe_detail_dto.dart';
import 'package:recipes/src/repositories/ingredient_repository_interface.dart';

class IngredientRepository implements IIngredientRepository {
  @override
  Future<List<IngredientData>> getAll() {
    return database.select(database.ingredient).get();
  }

  @override
  Future<int> deleteAllIngredientFromRecipe(
      RecipeDetailDto recipeDetailDto) async {
    return database.ingredient.deleteWhere((ingredient) =>
        ingredient.idRecipe.equals(recipeDetailDto.idRecipe ?? 0));
  }

  @override
  Future<List<IngredientData>>? getByRecipeId(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> insert(IngredientData ingredientData) {
    throw UnimplementedError();
  }

  @override
  Future<void> updates(
      List<IngredientDetailDto> ingredients, int idRecipe) async {
    for (var ingredient in ingredients) {
      IngredientCompanion ingredientCompanion = IngredientCompanion.insert(
          idRecipe: idRecipe,
          name: ingredient.name,
          quantity: ingredient.quantity ?? 0,
          unit: ingredient.unit);

      if (ingredient.idIngredient != null) {
        ingredientCompanion = IngredientCompanion.insert(
            idIngredient: Value(ingredient.idIngredient ?? 0),
            idRecipe: idRecipe,
            name: ingredient.name,
            quantity: ingredient.quantity ?? 0,
            unit: ingredient.unit);
      }

      await database.transaction(() async {
        await database
            .into(database.ingredient)
            .insert(ingredientCompanion, mode: InsertMode.insertOrReplace);
      });
    }
  }

  @override
  void deleteAll(List<IngredientDetailDto> ingredients) {
    for (var ingredient in ingredients) {
      database.ingredient.deleteOne(IngredientCompanion(
        idIngredient: Value(ingredient.idIngredient ?? 0),
      ));
    }
  }
}
