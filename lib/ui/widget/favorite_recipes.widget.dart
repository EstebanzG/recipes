import 'package:flutter/material.dart';

import 'meal_card.widget.dart';

class FavoriteRecipes extends StatelessWidget {
  const FavoriteRecipes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Explore tes recettes ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'favorites',
                  style: TextStyle(
                    color: Color(0xFFD52A2A),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: ' ❤️️',
                  style: TextStyle(
                    color: Color(0xFFD52929),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
            height: 200,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: const <Widget>[
                MealCard(),
                SizedBox(
                  width: 20,
                ),
                MealCard(),
                SizedBox(
                  width: 20,
                ),
                MealCard(),
                SizedBox(
                  width: 20,
                ),
                MealCard(),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
