import 'package:hive/hive.dart';

// Import the generated part file for code generation
part 'todo_item.g.dart'; // This is the generated part file

// HiveType annotation to specify the Hive type ID for the class
@HiveType(typeId: 0)
class TodoItem extends HiveObject {
  // HiveField annotation to indicate fields that will be stored in Hive
  @HiveField(0)
  String title; // Title of the todo item

  @HiveField(1)
  String details; // Details of the todo item

  // Constructor to initialize title and details
  TodoItem(this.title, this.details);
}
