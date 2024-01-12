/*import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import 'data/database/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();

  var recipeId =
      await database.into(database.recipes).insert(RecipesCompanion.insert(
            title: 'title',
            description: 'description',
            duration: 15,
          ));

  var ingredientId = await database
      .into(database.ingredients)
      .insert(IngredientsCompanion.insert(
        name: 'carrot',
      ));

  var recipeIngredientId = await database
      .into(database.recipeIngredients)
      .insert(RecipeIngredientsCompanion.insert(
        idRecipe: Value(recipeId),
        idIngredient: Value(ingredientId),
      ));

  List<Recipe> allItems = await database.select(database.recipes).get();

  print('items in database: $allItems');
}*/
