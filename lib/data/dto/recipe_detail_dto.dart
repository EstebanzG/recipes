import 'ingredient_detail_dto.dart';

class RecipeDetailDto {
  static const CATEGORIES = [
    'Apéritif',
    'Entrée',
    'Plat',
    'Sucré',
  ];

  late int? idRecipe;

  late bool favorite;

  late String title;

  late String category;

  late String description;

  late String? imageUrl;

  late int duration;

  late List<IngredientDetailDto> ingredients;

  RecipeDetailDto(this.idRecipe, this.favorite, this.title, this.category,
      this.description, this.imageUrl, this.duration, this.ingredients);

  @override
  String toString() {
    String message = "Recette : $title\nTemps de préparation : ${duration}mins\nIngrédients:\n";
    for (var ingredient in ingredients) {
      message += "- ${ingredient.name} - ${ingredient.quantity} ${ingredient.unit}\n";
    }
    return message += "Déroulé de la recette :\n $description";  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeDetailDto &&
          runtimeType == other.runtimeType &&
          idRecipe == other.idRecipe;

  @override
  int get hashCode => idRecipe.hashCode;
}
