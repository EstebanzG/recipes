import 'package:flutter/material.dart';
import 'package:recipes/ui/pages/form.page.dart';


class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text.rich(TextSpan(children: [
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
              text: 'Simon',
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
          ])),
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline,
              color: Colors.black,
              size: 35.0,
              semanticLabel: 'Settings button',
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FormPage(recipe: null)),
              );
            },
          ),
        ],
      ),
    );
  }
}
