import 'package:drift/drift.dart';
import 'package:recipes/data/database/database.dart';
import 'package:recipes/data/dto/recipe_detail_dto.dart';
import 'package:recipes/src/repositories/recipe_repository_interface.dart';

class RecipeRepository implements IRecipeRepository {

  @override
  Future<List<RecipeData>> getAll() {
    return database.select(database.recipe).get();
  }

  @override
  Future<void> delete(int id) {
    throw UnimplementedError();
  }

  @override
  Future<RecipeData?> getOne(int id) {
    throw UnimplementedError();
  }

  @override
  Future<int> insert(RecipeData recipe) async {
    var recipeId =
        await database.into(database.recipe).insert(RecipeCompanion.insert(
              title: recipe.title,
              description: recipe.description,
              duration: recipe.duration,
            ));

    return recipeId;
  }

  @override
  Future<void> update(RecipeData recipes) {
    throw UnimplementedError();
  }

  @override
  Future<void> insertRecipeWithIngredients(RecipeDetailDto recipe) async {
    var recipeId =
        await database.into(database.recipe).insert(RecipeCompanion.insert(
              title: recipe.title,
              description: recipe.description,
              duration: recipe.duration,
            ));

    var ingredientId = await database
        .into(database.ingredient)
        .insert(IngredientCompanion.insert(
          name: 'carrot',
        ));

    await database
        .into(database.recipeIngredient)
        .insert(RecipeIngredientCompanion.insert(
          idRecipe: Value(recipeId),
          idIngredient: Value(ingredientId),
        ));
  }
}
