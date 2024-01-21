import 'package:recipes/data/dto/ingredient_detail_dto.dart';
import 'package:recipes/data/dto/recipe_detail_dto.dart';
import 'package:recipes/src/repositories/recipe_repository.dart';

import '../../data/database/database.dart';
import '../repositories/ingredient_repository.dart';

class RecipeService {
  RecipeRepository recipeRepository = RecipeRepository();
  IngredientRepository ingredientRepository = IngredientRepository();

  Future<List<RecipeData>> getAllRecipes() async {
    return await recipeRepository.getAll();
  }

  void createNewRecipe(RecipeDetailDto recipeDto) {
    recipeRepository.insertRecipeWithIngredients(recipeDto);
  }

  void updateRecipe(RecipeDetailDto recipeDto) {
    recipeRepository.update(recipeDto);
    ingredientRepository.updates(
        recipeDto.ingredients, recipeDto.idRecipe ?? 0);
  }

  RecipeDetailDto createRecipeDtoFromData(
      RecipeData recipe, List<IngredientData> ingredients) {
    return RecipeDetailDto(
        recipe.idRecipe,
        recipe.title,
        recipe.description,
        recipe.duration,
        ingredients
            .map((ingredient) => IngredientDetailDto(ingredient.idIngredient,
                ingredient.name, ingredient.quantity, ingredient.unit))
            .toList());
  }
}
