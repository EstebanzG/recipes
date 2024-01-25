import 'package:drift/drift.dart';
import 'package:recipes/data/database/database.dart';
import 'package:recipes/data/dto/recipe_detail_dto.dart';
import 'package:recipes/src/repositories/recipe_repository_interface.dart';

class RecipeRepository implements IRecipeRepository {
  @override
  Future<List<RecipeData>> getAll() async {
    return await database.select(database.recipe).get();
  }

  Future<List<RecipeData>> getAllRecipeByName(String name) async {
    return await (database.recipe.select()..where((recipe) => recipe.title.contains(name))).get();
  }

  @override
  Future<bool> delete(RecipeDetailDto recipeDto) async {
    return database.recipe.deleteOne(RecipeCompanion(
      idRecipe: Value(recipeDto.idRecipe ?? 0),
    ));
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
              category: recipe.category,
              favorite: recipe.favorite,
              description: recipe.description,
              duration: recipe.duration,
            ));

    return recipeId;
  }

  @override
  Future<void> update(RecipeDetailDto recipe) async {
    database.update(database.recipe).replace(RecipeData(
        idRecipe: recipe.idRecipe ?? 0,
        favorite: recipe.favorite,
        title: recipe.title,
        category: recipe.category,
        description: recipe.description,
        duration: recipe.duration));
  }

  @override
  Future<void> insertRecipeWithIngredients(RecipeDetailDto recipe) async {
    var recipeId =
        await database.into(database.recipe).insert(RecipeCompanion.insert(
              title: recipe.title,
              category: recipe.category,
              favorite: recipe.favorite,
              description: recipe.description,
              duration: recipe.duration,
            ));
//todo change repository
    for (var ingredient in recipe.ingredients) {
      database.into(database.ingredient).insert(IngredientCompanion.insert(
            idRecipe: recipeId,
            name: ingredient.name,
            quantity: ingredient.quantity ?? 0,
            unit: ingredient.unit,
          ));
    }
  }
}
