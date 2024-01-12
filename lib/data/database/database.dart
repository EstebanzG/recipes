import 'dart:io';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:drift/drift.dart';

part 'database.g.dart';

class Recipes extends Table {
  IntColumn get idRecipe => integer().autoIncrement()();

  TextColumn get title => text().named('Title')();

  TextColumn get description => text().named('Description')();

  IntColumn get duration => integer().named('Duration')();
}

class Ingredients extends Table {
  IntColumn get idIngredient => integer().autoIncrement()();

  TextColumn get name => text().named('Name')();
}

class RecipeIngredients extends Table {
  IntColumn get idRecipeIngredient => integer().autoIncrement()();

  IntColumn get idRecipe =>
      integer().nullable().references(Recipe, #idRecipe)();

  IntColumn get idIngredient =>
      integer().nullable().references(Ingredients, #idIngredient)();
}

@DriftDatabase(tables: [Recipes, Ingredients, RecipeIngredients])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
