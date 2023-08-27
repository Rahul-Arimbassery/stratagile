import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stratagile/model/todo_item.dart';
import 'package:stratagile/view/homescreen.dart';

// Function to save data entered in the text fields
void saveData({
  required Box<TodoItem> todoBox,
  required TextEditingController titleController,
  required TextEditingController detailsController,
  required BuildContext context,
  required Function toggleTextFields,
}) {
  // Create a new TodoItem instance using data from text controllers
  final newTodo = TodoItem(titleController.text, detailsController.text);

  // Add the new todo to the Hive box
  todoBox.add(newTodo);

  // Clear text fields and hide keyboard
  titleController.clear();
  detailsController.clear();
  FocusScope.of(context).unfocus();

  // Toggle the visibility of text fields
  toggleTextFields();
}

// Function to toggle the visibility of text fields
void toggleTextFields({
  required Function setStateCallback,
}) {
  // Invert the value of showTextFields directly using setState
  setStateCallback(() {
    showTextFields = !showTextFields;
  });
}
