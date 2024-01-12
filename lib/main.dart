import 'package:flutter/material.dart';

import 'data/database/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();

  await database.into(database.todoItems).insert(TodoItemsCompanion.insert(
    title: 'todo: finish drift setup',
    content: 'We can now write queries and define our own tables.',
  ));
  List<TodoItem> allItems = await database.select(database.todoItems).get();

  print('items in database: $allItems');
}