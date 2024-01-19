import 'ingredient_detail_dto.dart';

class RecipeDetailDto {
  late int? idRecipe;

  late String title;

  late String description;

  late int duration;

  late List<IngredientDetailDto> ingredients;

  RecipeDetailDto(this.idRecipe, this.title, this.description, this.duration,
      this.ingredients);
}