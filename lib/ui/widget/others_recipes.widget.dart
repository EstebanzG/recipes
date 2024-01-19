import 'package:flutter/material.dart';

import '../../data/database/database.dart';
import 'meal_card.widget.dart';

class OtherRecipes extends StatelessWidget {

  final List<RecipeData> recipes;

  const OtherRecipes({
    super.key,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Ou cherche parmi tes ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'autres recettes',
                      style: TextStyle(
                        color: Color(0xFF6A736C),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: ' 🔎️️',
                      style: TextStyle(
                        color: Color(0xFFD52929),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 350,
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              hintText: 'Tarte à la tomate',
            ),
            cursorColor: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              for (var recipe in recipes) Column (
                children: [
                  MealCard(recipe: recipe),
                  const SizedBox(height: 20)
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}