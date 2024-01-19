import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/data/database/database.dart';
import 'package:recipes/data/dto/recipe_detail_dto.dart';
import 'package:recipes/ui/cubit/recipes.states.dart';

import '../../src/services/recipe_service.dart';
import 'cubit.state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipeService recipeService = RecipeService();

  RecipesCubit() : super(const InitialState<RecipesStateData>());

  void getAll() async {
    try {
      emit(const LoadingState<RecipesStateData>());
      final List<RecipeData> recipes = await recipeService.getAllRecipes();
      emit(
        SuccessState<RecipesStateData>(
          data: RecipesStateData(
            recipes: recipes,
          ),
        ),
      );
    } on Exception catch (exception) {
      emit(FailureState<RecipesStateData>(message: exception.toString()));
    }
  }

  void addNewRecipe(RecipeDetailDto recipe) {
    if (state is! SuccessState) return;
    final SuccessState<RecipesStateData> recipesState =
        state as SuccessState<RecipesStateData>;
    List<RecipeData> recipes = recipesState.data.recipes;

    emit(
      SuccessState<RecipesStateData>(
        data: RecipesStateData(
          recipes: List<RecipeData>.from(recipes)..add(RecipeData(
              idRecipe: recipe.idRecipe ?? 1,
              title: recipe.title,
              description: recipe.description,
              duration: recipe.duration)
          ),
        ),
      ),
    );
  }
}
