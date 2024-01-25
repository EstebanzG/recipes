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

  List<RecipeDetailDto> getAllRecipesByNameAndCategory(
      List<RecipeDetailDto> recipes, String name, String category) {
    return recipes
        .where((recipe) =>
            recipe.title.toLowerCase().contains(name.toLowerCase()) &&
            (recipe.category == category || category == ""))
        .toList();
  }

  void createNewRecipe(RecipeDetailDto recipeDto) {
    recipeRepository.insertRecipeWithIngredients(recipeDto);
  }

  void updateRecipe(RecipeDetailDto recipeDto) {
    recipeRepository.update(recipeDto);
    ingredientRepository.updates(
        recipeDto.ingredients, recipeDto.idRecipe ?? 0);
  }

  void deleteRecipe(RecipeDetailDto recipeDto) {
    ingredientRepository.deleteAllIngredientFromRecipe(recipeDto);
    recipeRepository.delete(recipeDto);
  }

  void deleteIngredients(List<IngredientDetailDto> ingredients) {
    ingredientRepository.deleteAll(ingredients);
  }

  RecipeDetailDto createRecipeDtoFromData(
      RecipeData recipe, List<IngredientData> ingredients) {
    return RecipeDetailDto(
        recipe.idRecipe,
        recipe.favorite,
        recipe.title,
        recipe.category,
        recipe.description,
        recipe.duration,
        ingredients
            .map((ingredient) => IngredientDetailDto(ingredient.idIngredient,
                ingredient.name, ingredient.quantity, ingredient.unit))
            .toList());
  }

  List<RecipeDetailDto> getFavoriteRecipes(List<RecipeDetailDto> recipes) {
    return recipes.where((recipe) => recipe.favorite == true).toList();
  }
}
