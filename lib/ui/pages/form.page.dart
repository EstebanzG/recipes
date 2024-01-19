import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/data/database/database.dart';
import 'package:recipes/data/dto/recipe_detail_dto.dart';

import '../../src/services/recipe_service.dart';
import '../cubit/recipes.cubit.dart';

class FormPage extends StatefulWidget {
  final RecipeData? recipe;
  final RecipesCubit recipesCubit;

  const FormPage({
    super.key,
    this.recipe, required this.recipesCubit,
  });

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final nameInputController = TextEditingController();
  final durationInputController = TextEditingController();
  final descriptionInputController = TextEditingController();

  RecipeService recipeService = RecipeService();
  final _formKey = GlobalKey<FormState>();

  void addNewRecipe(BuildContext context) {
    var recipe = RecipeDetailDto(
      null,
      nameInputController.text,
      descriptionInputController.text,
      int.parse(durationInputController.text),
      [],
    );
    recipeService.createNewRecipe(recipe);
    widget.recipesCubit.addNewRecipe(recipe);
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
                      controller: nameInputController,
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
                    ElevatedButton(
                      onPressed: () {
                        addNewRecipe(context);
                      },
                      child: const Text('Submit'),
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
