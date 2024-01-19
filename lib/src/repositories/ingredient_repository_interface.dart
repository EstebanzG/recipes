import '../../data/database/database.dart';

abstract class IIngredientRepository {
  Future<List<IngredientData>> getAll();
  Future<IngredientData?> getOne(int id);
  Future<void> insert(IngredientData book);
  Future<void> update(IngredientData book);
  Future<void> delete(int id);
}