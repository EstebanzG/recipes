import 'package:drift/drift.dart';
import 'package:petit_chef/data/models/recipe.dart';

class Ingredient extends Table {
  IntColumn get idIngredient => integer().autoIncrement()();

  IntColumn get idRecipe =>
      integer().references(Recipe, #idRecipe)();

  TextColumn get name => text().named('Name')();

  IntColumn get quantity => integer().named('Quantity')();

  TextColumn get unit => text().named('Unit')();
}