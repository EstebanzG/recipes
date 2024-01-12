import 'package:flutter/material.dart';
import 'package:recipes/ui/pages/home.page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Recipe App',
    theme: ThemeData(
      fontFamily: 'Roboto',
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.grey,
      ),
      dialogBackgroundColor: Colors.white,
      useMaterial3: true,
    ),
    home: const HomePage(),
  );
}
