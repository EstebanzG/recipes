import 'package:flutter/material.dart';
import 'package:recipes/data/database/database.dart';

import 'form.page.dart';

class DetailPage extends StatelessWidget {
  final RecipeData recipe;

  const DetailPage({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
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
                          semanticLabel: 'back to Homepage',
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FormPage(recipe: recipe)),
                          );
                        },
                        icon: const Icon(
                          Icons.mode_edit_outline,
                          color: Colors.black,
                          size: 35.0,
                          semanticLabel: 'Modify recipe',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        recipe.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flex(
                        direction: Axis.vertical,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                            size: 35.0,
                            semanticLabel: 'add to favorite',
                          ),
                          Text(
                            'Add to favorite',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Flex(
                        direction: Axis.vertical,
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            color: Colors.black,
                            size: 35.0,
                            semanticLabel: 'duration',
                          ),
                          Text(
                            '30 minutes',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '\u2022 Semoule 250 grammes',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '\u2022 Semoule 250 grammes',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '\u2022 Semoule 250 grammes',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ornare quis leo non sollicitudin. Fusce rhoncus rhoncus neque a lobortis. Duis arcu sapien, dapibus vestibulum odio non, suscipit vulputate augue. Proin at ante in enim viverra faucibus mollis non neque. Morbi tincidunt lorem nec nunc eleifend posuere. Sed justo massa, finibus eget lorem vitae, volutpat ullamcorper justo. Morbi tincidunt in turpis sit amet porta. Nulla volutpat nec libero vel feugiat. Donec a pretium sem, vel ultrices eros. Mauris lacus nunc, fermentum eu egestas sed, tincidunt sed risus. Cras aliquam bibendum quam. Sed maximus enim ut urna blandit pretium. Etiam dui ipsum, interdum a ligula sed, placerat molestie purus.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
