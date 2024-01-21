import 'ingredient_detail_dto.dart';

class RecipeDetailDto {
  late int? idRecipe;

  late String title;

  late String description;

  late int duration;

  late List<IngredientDetailDto> ingredients;

  RecipeDetailDto(this.idRecipe, this.title, this.description, this.duration,
      this.ingredients);

  @override
  String toString() {
    return 'RecipeDetailDto{idRecipe: $idRecipe, title: $title, description: $description, duration: $duration, ingredients: $ingredients}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeDetailDto &&
          runtimeType == other.runtimeType &&
          idRecipe == other.idRecipe;

  @override
  int get hashCode => idRecipe.hashCode;
}
