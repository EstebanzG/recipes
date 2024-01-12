import 'package:drift/drift.dart';
import 'package:recipes/data/database/database.dart';
import 'package:recipes/src/repositories/recipe_repository_interface.dart';

class RecipeRepository implements IRecipeRepository {
  AppDatabase database = AppDatabase();

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
  Future<void> insert(RecipeData recipe) {
    throw UnimplementedError();
  }

  @override
  Future<void> update(RecipeData recipes) {
    throw UnimplementedError();
  }

  Future<void> insertTestValues() async {
    var recipeId =
        await database.into(database.recipe).insert(RecipeCompanion.insert(
              title: 'title',
              description: 'description',
              duration: 15,
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
