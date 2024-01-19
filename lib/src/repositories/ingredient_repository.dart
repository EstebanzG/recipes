import 'package:recipes/data/database/database.dart';
import 'package:recipes/src/repositories/ingredient_repository_interface.dart';

class IngredientRepository implements IIngredientRepository {
  @override
  Future<List<IngredientData>> getAll() {
    return database.select(database.ingredient).get();
  }

  @override
  Future<void> delete(int id) {
    throw UnimplementedError();
  }

  @override
  Future<IngredientData?> getOne(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> insert(IngredientData recipe) {
    throw UnimplementedError();
  }

  @override
  Future<void> update(IngredientData recipes) {
    throw UnimplementedError();
  }
}
