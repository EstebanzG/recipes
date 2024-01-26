import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/data/database/database.dart';
import 'package:recipes/data/dto/recipe_detail_dto.dart';
import 'package:recipes/src/services/ingredient_service.dart';
import 'package:recipes/ui/cubit/recipes.states.dart';

import '../../src/services/recipe_service.dart';
import 'cubit.state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipeService recipeService = RecipeService();
  IngredientService ingredientService = IngredientService();

  RecipesCubit() : super(const InitialState<RecipesStateData>());

  void getAll() async {
    try {
      emit(const LoadingState<RecipesStateData>());
      final List<RecipeData> recipes = await recipeService.getAllRecipes();
      setState(await recipeService.createRecipesDto(recipes));
    } on Exception catch (exception) {
      emit(FailureState<RecipesStateData>(message: exception.toString()));
    }
  }

  void addNewRecipe(RecipeDetailDto recipe) {
    if (state is! SuccessState) return;
    final SuccessState<RecipesStateData> recipesState =
        state as SuccessState<RecipesStateData>;
    List<RecipeDetailDto> recipes = recipesState.data.recipes;

    setState(List<RecipeDetailDto>.from(recipes)..add(recipe));
  }

  void updateExistingRecipe(RecipeDetailDto recipe) {
    if (state is! SuccessState) return;
    final SuccessState<RecipesStateData> recipesState =
        state as SuccessState<RecipesStateData>;
    List<RecipeDetailDto> recipes = recipesState.data.recipes;
    recipes.removeWhere((element) => element.idRecipe == recipe.idRecipe);

    setState(List<RecipeDetailDto>.from(recipes)..add(recipe));
  }

  void deleteRecipe(RecipeDetailDto recipe) {
    if (state is! SuccessState) return;
    final SuccessState<RecipesStateData> recipesState =
    state as SuccessState<RecipesStateData>;
    List<RecipeDetailDto> recipes = recipesState.data.recipes;
    recipes.removeWhere((element) => element.idRecipe == recipe.idRecipe);

    setState(List<RecipeDetailDto>.from(recipes));
  }

  void setState(List<RecipeDetailDto> recipes) {
    recipes.sort((a, b) => a.title.compareTo(b.title));
    emit(
      SuccessState<RecipesStateData>(
        data: RecipesStateData(recipes: recipes),
      ),
    );
  }
}
