import 'dart:io';

import 'package:flutter/material.dart';

import '../../data/dto/recipe_detail_dto.dart';
import '../cubit/recipes.cubit.dart';
import '../widget/detail_information.dart';
import 'form.page.dart';

class DetailPage extends StatefulWidget {
  final RecipeDetailDto recipe;
  final RecipesCubit recipesCubit;

  const DetailPage({
    Key? key,
    required this.recipe,
    required this.recipesCubit,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late RecipeDetailDto localRecipe;

  @override
  void initState() {
    super.initState();
    localRecipe = widget.recipe;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                if (localRecipe.imageUrl != null && localRecipe.imageUrl != "")
                  Image.file(
                    File(localRecipe.imageUrl!),
                  )
                else
                  Container(
                    height: 350,
                    color: const Color.fromRGBO(217, 217, 217, 100),
                  ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                          size: 35.0,
                          semanticLabel: 'Retour',
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          var updatedRecipe = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormPage(
                                recipe: localRecipe,
                                recipesCubit: widget.recipesCubit,
                              ),
                            ),
                          );

                          if (updatedRecipe != null) {
                           setState(() {
                             localRecipe = updatedRecipe;
                           });
                          }
                        },
                        icon: const Icon(
                          Icons.mode_edit_outline,
                          color: Colors.black,
                          size: 35.0,
                          semanticLabel: 'Modifier la recette',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DetailInformation(recipe: localRecipe, recipesCubit: widget.recipesCubit)
          ]),
        ),
      ),
    );
  }
}
