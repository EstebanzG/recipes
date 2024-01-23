import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/dto/ingredient_detail_dto.dart';
import '../../data/dto/recipe_detail_dto.dart';
import '../../src/services/recipe_service.dart';
import '../cubit/recipes.cubit.dart';
import '../widget/ingredient_form.widget.dart';

class FormPage extends StatefulWidget {
  final RecipeDetailDto? recipe;
  final RecipesCubit recipesCubit;

  const FormPage({
    super.key,
    this.recipe,
    required this.recipesCubit,
  });

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  RecipeService recipeService = RecipeService();

  final TextEditingController titleInputController = TextEditingController();
  final TextEditingController durationInputController = TextEditingController();
  final TextEditingController descriptionInputController =
      TextEditingController();
  List<IngredientDetailDto> ingredients = [
    IngredientDetailDto(null, "", null, ""),
  ];

  @override
  void initState() {
    super.initState();
    if (widget.recipe is RecipeDetailDto) {
      titleInputController.text = widget.recipe!.title;
      durationInputController.text = widget.recipe!.duration.toString();
      descriptionInputController.text = widget.recipe!.description;
      if (widget.recipe!.ingredients.isNotEmpty) {
        ingredients = widget.recipe!.ingredients;
      }
    }
  }

  void duplicateIngredient() {
    setState(() {
      ingredients.add(IngredientDetailDto(null, "", 0, ""));
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
      descriptionInputController.text,
      int.parse(durationInputController.text),
      ingredients,
    );
    if (widget.recipe is RecipeDetailDto) {
      updateRecipe(context, recipe);
    } else {
      addNewRecipe(context, recipe);
    }
  }

  void updateRecipe(BuildContext context, RecipeDetailDto recipe) {
    recipeService.updateRecipe(recipe);
    widget.recipesCubit.updateExistingRecipe(recipe);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void addNewRecipe(BuildContext context, RecipeDetailDto recipe) {
    recipeService.createNewRecipe(recipe);
    widget.recipesCubit.addNewRecipe(recipe);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Form(
            child: Column(children: [
              Stack(
                children: [
                  Container(
                    height: 350,
                    color: const Color.fromRGBO(217, 217, 217, 100),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                        size: 35.0,
                        semanticLabel: 'back to Homepage',
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleInputController,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.set_meal,
                          color: Colors.black,
                          size: 35.0,
                          semanticLabel: 'name',
                        ),
                        hintText: 'How this recipe is called',
                        labelText: 'Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: durationInputController,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.timer_outlined,
                          color: Colors.black,
                          size: 35.0,
                          semanticLabel: 'duration',
                        ),
                        hintText: 'How long is the recipe',
                        labelText: 'Duration',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: descriptionInputController,
                      maxLines: 10,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.description,
                          color: Colors.black,
                          size: 35.0,
                          semanticLabel: 'description',
                        ),
                        hintText: 'Describe the process of creation',
                        labelText: 'Process',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    for (int index = 0; index < ingredients.length; index++)
                      IngredientForm(
                        ingredient: ingredients[index],
                        onUpdate: (IngredientDetailDto ingredient) {
                          updateIngredient(index, ingredient);
                        },
                      ),
                    ElevatedButton.icon(
                      onPressed: duplicateIngredient,
                      icon: const Icon(
                        Icons.add_circle_outlined,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        fixedSize:
                            Size(MediaQuery.of(context).size.width - 50, 40),
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
                        registerRecipe(context);
                      },
                      icon: const Icon(Icons.check),
                      label: const Text('Enregistrer la recette'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[100],
                        foregroundColor: Colors.black
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
