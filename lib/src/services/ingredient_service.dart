import '../../data/database/database.dart';
import '../repositories/ingredient_repository.dart';

class IngredientService {
  IngredientRepository ingredientRepository = IngredientRepository();

  Future<List<IngredientData>> getAllIngredients() async {
    return await ingredientRepository.getAll();
  }
}
