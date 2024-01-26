import 'package:petit_chef/data/dto/recipe_detail_dto.dart';

import 'cubit.state.dart';

typedef RecipesState = CubitState<RecipesStateData>;

class RecipesStateData {
  const RecipesStateData({
    required this.recipes,
  });

  final List<RecipeDetailDto> recipes;
}
