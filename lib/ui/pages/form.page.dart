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
    Key? key,
    this.recipe,
    required this.recipesCubit,
  }) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final RecipeService recipeService = RecipeService();
  final TextEditingController titleInputController = TextEditingController();
  final TextEditingController durationInputController = TextEditingController();
  final TextEditingController descriptionInputController =
      TextEditingController();
  List<IngredientDetailDto> ingredients = [
    IngredientDetailDto(null, "", null, "")
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
      durationInputController.text = widget.recipe!.duration.toString();
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
    List<int?> ids = ingredients.map((ingredient) => ingredient.idIngredient).toList();
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
      descriptionInputController.text,
      int.parse(durationInputController.text),
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
    return Stack(
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
    );
  }

  Widget buildFormFields(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          buildTextFormField(
            controller: titleInputController,
            icon: Icons.set_meal,
            hintText: 'How this recipe is called',
            labelText: 'Name',
          ),
          buildTextFormField(
            controller: durationInputController,
            icon: Icons.timer_outlined,
            hintText: 'How long is the recipe',
            labelText: 'Duration',
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
          buildTextFormField(
            controller: descriptionInputController,
            icon: Icons.description,
            hintText: 'Describe the process of creation',
            labelText: 'Process',
            maxLines: 10,
          ),
          SizedBox(
            height: 10,
          ),
          buildIngredientForms(context),
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
              registerRecipe(context);
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

  Widget buildTextFormField({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    required String labelText,
    int? maxLines,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: Colors.black,
          size: 35.0,
          semanticLabel: labelText,
        ),
        hintText: hintText,
        labelText: labelText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      maxLines: maxLines,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
    );
  }

  Widget buildIngredientForms(BuildContext context) {
    return Column(
      children: [
        for (int index = 0; index < ingredients.length; index++)
          IngredientForm(
            key: ValueKey(ingredients[index].idIngredient), // Use the unique identifier as a key
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
