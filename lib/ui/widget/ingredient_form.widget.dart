// ingredient_form.widget.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipes/data/dto/ingredient_detail_dto.dart';

class IngredientForm extends StatefulWidget {
  final IngredientDetailDto ingredient;
  final ValueChanged<IngredientDetailDto> onUpdate;

  const IngredientForm({
    Key? key,
    required this.ingredient,
    required this.onUpdate,
  }) : super(key: key);

  @override
  State<IngredientForm> createState() => _IngredientFormState();
}

class _IngredientFormState extends State<IngredientForm> {
  final nameInputController = TextEditingController();
  final quantityInputController = TextEditingController();
  final unitInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameInputController.text = widget.ingredient.name;
    quantityInputController.text = widget.ingredient.quantity.toString();
    unitInputController.text = widget.ingredient.unit;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 200,
      child: Column(
        children: [
          TextFormField(
            controller: nameInputController,
            onChanged: (_) => _updateIngredient(),
            decoration: const InputDecoration(
              hintText: 'Ingredient',
              labelText: 'Ingredient',
            ),
          ),
          const SizedBox(width: 10),
          TextFormField(
            controller: quantityInputController,
            onChanged: (_) => _updateIngredient(),
            decoration: const InputDecoration(
              hintText: 'Quantity',
              labelText: 'Quantity',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
          const SizedBox(width: 10),
          DropdownMenu(
            controller: unitInputController,
            initialSelection: IngredientDetailDto.UNITS.first,
            onSelected: (_) => _updateIngredient(),
            dropdownMenuEntries: IngredientDetailDto.UNITS
                .map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
            }).toList(),
          ),
        ],
      ),
    );
  }

  void _updateIngredient() {
    widget.onUpdate(
      IngredientDetailDto(
        widget.ingredient.idIngredient,
        nameInputController.text,
        int.tryParse(quantityInputController.text) ?? 0,
        unitInputController.text,
      ),
    );
  }
}
