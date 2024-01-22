import 'package:drift/drift.dart';

import '../../data/database/database.dart';
import '../repositories/ingredient_repository.dart';

class IngredientService {
  IngredientRepository ingredientRepository = IngredientRepository();

  Future<List<IngredientData>> getAllIngredients() async {
    return await ingredientRepository.getAll();
  }

  Future<List<IngredientData>> getIngredientsByRecipeId(int recipeId) async {
    return await (database.ingredient.select()
          ..where((ingredient) => ingredient.idRecipe.equals(recipeId)))
        .get(); //todo put in repo
  }
}
