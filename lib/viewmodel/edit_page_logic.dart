import 'package:flutter/material.dart';
import 'package:stratagile/model/todo_item.dart';
import 'package:stratagile/view/editpage.dart';

// Function to navigate to the EditPage for editing a todo item
void navigateToEditPage({
  required BuildContext context,
  required TodoItem todoItem,
  required Function setStateCallback,
}) async {
  // Navigate to the EditPage and await the result
  final result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EditPage(
        initialTitle: todoItem.title,
        initialDetails: todoItem.details,
      ),
    ),
  );

  // Check if the result is a Map with editedTitle and editedDetails
  if (result is Map<String, dynamic>) {
    if (result.containsKey('editedTitle') &&
        result.containsKey('editedDetails')) {
      // Update todoItem's title and details with edited values
      setStateCallback(() {
        todoItem.title = result['editedTitle'];
        todoItem.details = result['editedDetails'];
      });
      // Save the edited todoItem back to the data storage
      todoItem.save();
    }
    // Check if the result indicates deletion of the todo item
    else if (result.containsKey('delete') && result['delete']) {
      // Delete the todoItem from the data storage
      setStateCallback(() {
        todoItem.delete();
      });
    }
  }
}
