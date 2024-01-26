import 'package:drift/drift.dart';
import 'package:petit_chef/data/database/database.dart';
import 'package:petit_chef/data/dto/ingredient_detail_dto.dart';
import 'package:petit_chef/data/dto/recipe_detail_dto.dart';
import 'package:petit_chef/src/repositories/ingredient_repository_interface.dart';

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
  Future<void> insert(IngredientDetailDto ingredient, int recipeId) async {
    database.into(database.ingredient).insert(IngredientCompanion.insert(
          idRecipe: recipeId,
          name: ingredient.name,
          quantity: ingredient.quantity ?? 0,
          unit: ingredient.unit,
        ));
  }

  @override
  Future<void> updateAll(
      List<IngredientDetailDto> ingredients, int idRecipe) async {
    for (var ingredient in ingredients) {
      IngredientCompanion ingredientCompanion;

      if (ingredient.idIngredient != null) {
        ingredientCompanion = IngredientCompanion.insert(
            idIngredient: Value(ingredient.idIngredient ?? 0),
            idRecipe: idRecipe,
            name: ingredient.name,
            quantity: ingredient.quantity ?? 0,
            unit: ingredient.unit);
      } else {
        ingredientCompanion = IngredientCompanion.insert(
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

  Future<List<IngredientData>> getIngredientsByRecipeId(int recipeId) async {
    return await (database.ingredient.select()
          ..where((ingredient) => ingredient.idRecipe.equals(recipeId)))
        .get();
  }

  Future<void> insertAll(
      List<IngredientDetailDto> ingredients, int recipeId) async {
    for (var ingredient in ingredients) {
      insert(ingredient, recipeId);
    }
  }
}
