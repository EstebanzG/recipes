import 'package:drift/drift.dart';

class Recipe extends Table {
  IntColumn get idRecipe => integer().autoIncrement()();

  TextColumn get title => text().named('Title')();

  TextColumn get category => text().named('Category')();

  TextColumn get imageUrl => text().named('ImageUrl')();

  BoolColumn get favorite => boolean().named('Favorite')();

  TextColumn get description => text().named('Description')();

  IntColumn get duration => integer().named('Duration')();
}