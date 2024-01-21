
class IngredientDetailDto {
  static const UNITS = [
    'gramme',
    'unité(s)',
    'ml',
    'cuillère à soupe'
  ];

  late int? idIngredient;

  late String name;

  late int quantity;

  late String unit;

  IngredientDetailDto(this.idIngredient, this.name, this.quantity, this.unit);

  @override
  String toString() {
    return 'IngredientDetailDto{idIngredient: $idIngredient, name: $name, quantity: $quantity, unit: $unit}';
  }
}