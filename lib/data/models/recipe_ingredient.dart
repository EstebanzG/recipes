import 'package:drift/drift.dart';

import 'recipe.dart';
import 'ingredient.dart';

class RecipeIngredient extends Table {
  IntColumn get idRecipeIngredient => integer().autoIncrement()();

  IntColumn get idRecipe =>
      integer().nullable().references(Recipe, #idRecipe)();

  IntColumn get idIngredient =>
      integer().nullable().references(Ingredient, #idIngredient)();
}