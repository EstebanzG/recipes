import 'package:petit_chef/data/dto/ingredient_detail_dto.dart';
import 'package:petit_chef/data/dto/recipe_detail_dto.dart';
import 'package:petit_chef/src/repositories/recipe_repository.dart';
import 'package:petit_chef/src/services/ingredient_service.dart';

import '../../data/database/database.dart';

class RecipeService {
  RecipeRepository recipeRepository = RecipeRepository();
  IngredientService ingredientService = IngredientService();

  Future<List<RecipeData>> getAllRecipes() async {
    return await recipeRepository.getAll();
  }

  List<RecipeDetailDto> filterRecipesByNameAndCategory(
      List<RecipeDetailDto> recipes, String name, String category) {
    return recipes
        .where((recipe) =>
            recipe.title.toLowerCase().contains(name.toLowerCase()) &&
            (recipe.category == category || category == ""))
        .toList();
  }

  List<RecipeDetailDto> filterRecipesByFavorite(List<RecipeDetailDto> recipes) {
    return recipes.where((recipe) => recipe.favorite == true).toList();
  }

  Future<void> createNewRecipe(RecipeDetailDto recipeDto) async {
    var recipeId =
        await recipeRepository.insertRecipeWithIngredients(recipeDto);
    ingredientService.insertAll(recipeDto.ingredients, recipeId);
  }

  void updateRecipe(RecipeDetailDto recipeDto) {
    recipeRepository.update(recipeDto);
    ingredientService.updateAll(recipeDto.ingredients, recipeDto.idRecipe ?? 0);
  }

  void deleteRecipe(RecipeDetailDto recipeDto) {
    ingredientService.deleteAllIngredientFromRecipe(recipeDto);
    recipeRepository.delete(recipeDto);
  }

  void deleteIngredients(List<IngredientDetailDto> ingredients) {
    ingredientService.deleteAll(ingredients);
  }

  RecipeDetailDto createRecipeDtoFromData(
      RecipeData recipe, List<IngredientData> ingredients) {
    return RecipeDetailDto(
        recipe.idRecipe,
        recipe.favorite,
        recipe.title,
        recipe.category,
        recipe.description,
        recipe.imageUrl,
        recipe.duration,
        ingredients
            .map((ingredient) => IngredientDetailDto(ingredient.idIngredient,
                ingredient.name, ingredient.quantity, ingredient.unit))
            .toList());
  }

  Future<List<RecipeDetailDto>> createRecipesDto(
      List<RecipeData> recipes) async {
    List<RecipeDetailDto> recipesDto = [];
    for (var recipe in recipes) {
      List<IngredientData> recipeIngredients =
          await ingredientService.getIngredientsByRecipeId(recipe.idRecipe);

      recipesDto.add(createRecipeDtoFromData(recipe, recipeIngredients));
    }

    return recipesDto;
  }
}
