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
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController unitController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.ingredient.name;
    quantityController.text = widget.ingredient.quantity.toString();
    unitController.text = widget.ingredient.unit;
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          child: TextFormField(
            controller: nameController,
            onChanged: (_) => _updateIngredient(),
            decoration: const InputDecoration(
              hintText: 'Ingredient',
              labelText: 'Ingredient',
            ),
          ),
        ),
        SizedBox(
          width:
              MediaQuery.of(context).size.width / 4, // Adjust width as needed
          child: TextFormField(
            controller: quantityController,
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
        ),
        DropdownMenu(
          width: MediaQuery.of(context).size.width / 4,
          controller: unitController,
          initialSelection: IngredientDetailDto.UNITS.first,
          onSelected: (_) => _updateIngredient(),
          dropdownMenuEntries: IngredientDetailDto.UNITS
              .map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        )
      ],
    );
  }

  void _updateIngredient() {
    widget.onUpdate(
      IngredientDetailDto(
        widget.ingredient.idIngredient,
        nameController.text,
        int.tryParse(quantityController.text) ?? 0,
        unitController.text,
      ),
    );
  }
}
