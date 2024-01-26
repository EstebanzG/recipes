import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/const/measure_units.dart';
import '../../data/dto/ingredient_detail_dto.dart';

class IngredientForm extends StatefulWidget {
  final IngredientDetailDto ingredient;
  final Function(IngredientDetailDto) onUpdate;
  final Function(IngredientDetailDto) onIngredientDelete;

  const IngredientForm({
    Key? key,
    required this.ingredient,
    required this.onUpdate,
    required this.onIngredientDelete,
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
    initializeControllers();
  }

  void initializeControllers() {
    nameController.text = widget.ingredient.name;
    quantityController.text = widget.ingredient.quantity.toString();
    unitController.text = widget.ingredient.unit;
  }

  void deleteIngredient() {
    widget.onIngredientDelete(widget.ingredient);
  }

  void updateIngredient() {
    widget.onUpdate(
      IngredientDetailDto(
        widget.ingredient.idIngredient,
        nameController.text,
        int.tryParse(quantityController.text) ?? 0,
        unitController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey.shade200),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNameTextField(),
                  const SizedBox(height: 5),
                  _buildQuantityAndUnitFields(),
                ],
              ),
            ),
            _buildDeleteButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildNameTextField() {
    return TextFormField(
      controller: nameController,
      onChanged: (_) => updateIngredient(),
      decoration: const InputDecoration(
        hintText: 'Quel ingrédient ajouter ?',
        labelText: 'Nom de l\'ingredient',
        prefixIcon: Icon(Icons.set_meal_outlined),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Le nom de l\'ingredient est obligatoire';
        }
        return null;
      },
    );
  }

  Widget _buildQuantityAndUnitFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          child: TextFormField(
            controller: quantityController,
            onChanged: (_) => updateIngredient(),
            decoration: const InputDecoration(
              hintText: 'Quantité',
              labelText: 'Quantité',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'La quantité est obligatoire';
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 10),
        DropdownMenu(
          width: MediaQuery.of(context).size.width / 2.5,
          controller: unitController,
          initialSelection: MeasureUnits.allUnits.first,
          inputDecorationTheme: const InputDecorationTheme(
            border: InputBorder.none,
          ),
          onSelected: (_) => updateIngredient(),
          dropdownMenuEntries: MeasureUnits.allUnits
              .map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDeleteButton() {
    return IconButton(
      onPressed: deleteIngredient,
      icon: const Icon(Icons.delete),
    );
  }
}