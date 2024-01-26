import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toastification/toastification.dart';
import '../../data/dto/ingredient_detail_dto.dart';
import '../../data/dto/recipe_detail_dto.dart';
import '../../src/services/recipe_service.dart';
import '../cubit/recipes.cubit.dart';
import '../widget/ingredient_form.widget.dart';

class FormPage extends StatefulWidget {
  final RecipeDetailDto? recipe;
  final RecipesCubit recipesCubit;

  const FormPage({
    Key? key,
    this.recipe,
    required this.recipesCubit,
  }) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  File? _imageFile;
  final RecipeService recipeService = RecipeService();
  final TextEditingController titleInputController = TextEditingController();
  final TextEditingController categoryInputController = TextEditingController();
  final TextEditingController durationInputController = TextEditingController();
  final TextEditingController descriptionInputController =
      TextEditingController();
  List<IngredientDetailDto> ingredients = [
    IngredientDetailDto(null, "", 0, "")
  ];
  List<IngredientDetailDto> ingredientsToDelete = [];

  @override
  void initState() {
    super.initState();
    initializeForm();
  }

  void initializeForm() {
    if (widget.recipe is RecipeDetailDto) {
      titleInputController.text = widget.recipe!.title;
      categoryInputController.text = widget.recipe!.category;
      durationInputController.text = widget.recipe!.duration.toString();
      if (widget.recipe?.imageUrl != "") {
        _imageFile = File(widget.recipe!.imageUrl ?? "");
      }
      descriptionInputController.text = widget.recipe!.description;
      if (widget.recipe!.ingredients.isNotEmpty) {
        ingredients = List.from(widget.recipe!.ingredients);
      }
    }
  }

  void deleteIngredient(IngredientDetailDto ingredient) {
    ingredients.remove(ingredient);
    ingredientsToDelete.add(ingredient);
    setState(() {});
  }

  int getNextId() {
    List<int?> ids =
        ingredients.map((ingredient) => ingredient.idIngredient).toList();
    int nextId = 0;
    while (ids.contains(nextId)) {
      nextId = nextId + 1;
    }

    return nextId;
  }

  void duplicateIngredient() {
    setState(() {
      ingredients.add(IngredientDetailDto(getNextId(), "", 0, ""));
    });
  }

  void updateIngredient(int index, IngredientDetailDto ingredient) {
    setState(() {
      ingredients[index] = ingredient;
    });
  }

  void registerRecipe(BuildContext context) {
    var recipe = RecipeDetailDto(
      widget.recipe?.idRecipe,
      false,
      titleInputController.text,
      categoryInputController.text,
      descriptionInputController.text,
      _imageFile?.path,
      int.tryParse(durationInputController.text) ?? 0,
      List.from(ingredients),
    );
    if (widget.recipe is RecipeDetailDto) {
      updateRecipe(context, recipe);
    } else {
      addNewRecipe(context, recipe);
    }
    recipeService.deleteIngredients(ingredientsToDelete);
  }

  void updateRecipe(BuildContext context, RecipeDetailDto recipe) {
    recipeService.updateRecipe(recipe);
    widget.recipesCubit.updateExistingRecipe(recipe);
    Navigator.pop(context, recipe);
  }

  void addNewRecipe(BuildContext context, RecipeDetailDto recipe) {
    recipeService.createNewRecipe(recipe);
    widget.recipesCubit.addNewRecipe(recipe);
    Navigator.pop(context);
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                buildHeader(context),
                buildFormFields(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return AppBar(title: const Text("Nouvelle recette"));
  }

  Widget buildFormFields(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          _buildImagePicker(),
          TextFormField(
            controller: titleInputController,
            decoration: const InputDecoration(
              hintText: 'Nom de la recette',
              labelText: 'Comment s\'appelle-t-elle ?',
              prefixIcon: Icon(Icons.fastfood),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Le nom de la recette est obligatoire';
              }
              return null;
            },
          ),
          DropdownMenu(
            width: MediaQuery.of(context).size.width,
            controller: categoryInputController,
            initialSelection: categoryInputController.text,
            inputDecorationTheme: const InputDecorationTheme(
              border: InputBorder.none,
            ),
            hintText: 'Catégorie',
            dropdownMenuEntries: RecipeDetailDto.CATEGORIES
                .map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
            }).toList(),
          ),
          TextFormField(
            controller: durationInputController,
            decoration: const InputDecoration(
              hintText: 'Temps de réalisation',
              labelText: 'En combien de temps (minutes) l\'a réalise-t-on ?',
              prefixIcon: Icon(Icons.timer_outlined),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
          TextFormField(
            controller: descriptionInputController,
            decoration: const InputDecoration(
              hintText: 'Quelles sont ses étapes de création ?',
              labelText: 'Description de la réalisation',
              prefixIcon: Icon(Icons.description),
            ),
            maxLines: 7,
          ),
          const SizedBox(
            height: 10,
          ),
          buildIngredientForms(context),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton.icon(
            onPressed: duplicateIngredient,
            icon: const Icon(Icons.add_circle_outlined),
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(),
              fixedSize: Size(MediaQuery.of(context).size.width - 50, 40),
              backgroundColor: Colors.grey[100],
              foregroundColor: Colors.black,
            ),
            label: const Text('Ajouter un ingrédient'),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton.icon(
            onPressed: () {
              if (ingredients.isEmpty) {
                buildToastMissingIngredientWidget(context);
              } else if (_formKey.currentState!.validate()) {
                registerRecipe(context);
              }
            },
            icon: const Icon(Icons.check),
            label: const Text('Enregistrer la recette'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[100],
              foregroundColor: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildImagePicker() {
    return Column(
      children: [
        if (_imageFile != null)
          Image.file(
            _imageFile!,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ElevatedButton(
          onPressed: _pickImage,
          child: const Text('Choisir une image'),
        ),
      ],
    );
  }

  void buildToastMissingIngredientWidget(BuildContext context) {
    toastification.show(
      context: context,
      title: RichText(
        text: const TextSpan(
            text: "Information manquante",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      description: RichText(
        text: TextSpan(
            text: "Au moins un ingrédient est nécessaire",
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.grey.shade700)),
      ),
      autoCloseDuration: const Duration(seconds: 3),
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
    );
  }

  Widget buildIngredientForms(BuildContext context) {
    return Column(
      children: [
        for (int index = 0; index < ingredients.length; index++)
          IngredientForm(
            key: ValueKey(ingredients[index].idIngredient),
            ingredient: ingredients[index],
            onUpdate: (IngredientDetailDto ingredient) {
              updateIngredient(index, ingredient);
            },
            onIngredientDelete: (IngredientDetailDto ingredient) {
              deleteIngredient(ingredients[index]);
            },
          ),
      ],
    );
  }
}
