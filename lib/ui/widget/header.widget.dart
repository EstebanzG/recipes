import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/recipes.cubit.dart';
import '../pages/form.page.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: const Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Bonjour, ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            TextSpan(
              text: 'Chef',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                height: 0,
              ),
            ),
            TextSpan(
              text: ' 👋',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FormPage(
                  recipe: null,
                  recipesCubit: BlocProvider.of<RecipesCubit>(context),
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.add_circle_outline,
            color: Colors.black,
            size: 35.0,
            semanticLabel: 'Settings button',
          ),
        ),
      ],
    );
  }
}
