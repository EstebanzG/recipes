import 'package:recipes/data/database/database.dart';
import 'package:recipes/data/dto/recipe_detail_dto.dart';
import 'package:recipes/src/repositories/recipe_repository_interface.dart';

class RecipeRepository implements IRecipeRepository {
  @override
  Future<List<RecipeData>> getAll() async {
    return await database.select(database.recipe).get();
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
  Future<void> update(RecipeDetailDto recipe) async {
    database.update(database.recipe).replace(RecipeData(
        idRecipe: recipe.idRecipe ?? 0,
        title: recipe.title,
        description: recipe.description,
        duration: recipe.duration));
  }

  @override
  Future<void> insertRecipeWithIngredients(RecipeDetailDto recipe) async {
    var recipeId =
        await database.into(database.recipe).insert(RecipeCompanion.insert(
              title: recipe.title,
              description: recipe.description,
              duration: recipe.duration,
            ));

    for (var ingredient in recipe.ingredients) {
      database.into(database.ingredient).insert(IngredientCompanion.insert(
            idRecipe: recipeId,
            name: ingredient.name,
            quantity: ingredient.quantity,
            unit: ingredient.unit,
          ));
    }
  }
}
