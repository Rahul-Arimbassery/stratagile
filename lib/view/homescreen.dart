import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stratagile/model/todo_item.dart';
import 'package:stratagile/viewmodel/edit_page_logic.dart';
import 'package:stratagile/viewmodel/home_page_logic.dart';

// Variable to control the visibility of text fields
bool showTextFields = true;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controllers for the title and details text fields
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  // Hive box to store todo items
  late Box<TodoItem> todoBox;

  @override
  void initState() {
    super.initState();
    todoBox = Hive.box<TodoItem>('todoBox'); // Initialize the Hive box
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App - Stratagile'), //Display text on AppBar
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showTextFields)
                Column(
                  children: [
                    //Textfield to enter details from user
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: detailsController,
                      decoration: const InputDecoration(
                        labelText: 'Details',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 4,
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () => saveData(
                        todoBox: todoBox,
                        titleController: titleController,
                        detailsController: detailsController,
                        context: context,
                        toggleTextFields: () => toggleTextFields(
                          setStateCallback: setState,
                        ),
                      ),
                      child: const Text('Add to List'), //Add items to list
                    ),
                  ],
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: todoBox.length,
                  itemBuilder: (context, index) {
                    final todoItem = todoBox.getAt(index);
                    return Card(
                      elevation: 4.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        onTap: () {
                          navigateToEditPage(
                            context: context,
                            todoItem: todoItem,
                            setStateCallback: setState,
                          );
                        },
                        title: Text(
                          todoItem!.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        subtitle: Text(todoItem.details),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => toggleTextFields(
                  setStateCallback: setState,
                ),
                child: Text(
                    showTextFields ? 'Hide Text Fields' : 'Show Text Fields'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
