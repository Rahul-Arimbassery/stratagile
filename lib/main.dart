import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stratagile/model/todo_item.dart';
import 'package:stratagile/view/splashscreen.dart';

void main() async {
  // Initialize Hive Flutter
  await Hive.initFlutter();

  // Register the TodoItemAdapter for serialization/deserialization
  Hive.registerAdapter(TodoItemAdapter());

  // Open the Hive box for TodoItem
  await Hive.openBox<TodoItem>('todoBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Disable the debug banner
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(), // Display the SplashScreen widget
      ),
    );
  }
}
