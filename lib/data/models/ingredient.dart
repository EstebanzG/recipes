import 'package:drift/drift.dart';

class Ingredient extends Table {
  IntColumn get idIngredient => integer().autoIncrement()();

  TextColumn get name => text().named('Name')();
}