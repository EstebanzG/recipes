
import 'package:recipes/data/database/database.dart';

import 'cubit.state.dart';

typedef RecipesState = CubitState<RecipesStateData>;

class RecipesStateData {
  const RecipesStateData({
    required this.recipes,
  });

  final List<RecipeData> recipes;
}