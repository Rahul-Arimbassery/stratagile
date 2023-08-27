import 'package:flutter/material.dart';

// EditPage widget for editing todo items
class EditPage extends StatefulWidget {
  final String initialTitle;
  final String initialDetails;

  // Constructor to receive initial title and details
  const EditPage({
    required this.initialTitle,
    required this.initialDetails,
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController _titleController;
  late TextEditingController _detailsController;
  bool _editing = false;

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with initial values
    _titleController = TextEditingController(text: widget.initialTitle);
    _detailsController = TextEditingController(text: widget.initialDetails);
  }

  // Function to toggle between editing and non-editing modes
  void _toggleEditing() {
    setState(() {
      if (!_editing) {
        // Enter editing mode
        _editing = true;
      } else {
        // Save changes and exit editing mode
        _editing = false;
        Navigator.of(context).pop(
          {
            'editedTitle': _titleController.text,
            'editedDetails': _detailsController.text,
          },
        );
      }
    });
  }

  // Function to handle item deletion
  void _deleteItem() {
    // Pop the route with delete flag
    Navigator.of(context).pop({'delete': true});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Change title based on editing state
        title: Text(_editing ? 'Edit Page' : 'Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              enabled: _editing, // Enable editing based on state
              decoration: InputDecoration(
                labelText: 'Title',
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _detailsController,
              enabled: _editing, // Enable editing based on state
              decoration: InputDecoration(
                labelText: 'Details',
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16.0),
            ListTile(
              // Display different widgets based on editing state
              title: _editing
                  ? ElevatedButton(
                      onPressed: _toggleEditing,
                      child: const Text('Update'),
                    )
                  : Text(
                      _titleController.text,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
              subtitle: _editing
                  ? const SizedBox.shrink()
                  : Text(
                      _detailsController.text,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                      ),
                    ),
              trailing: _editing
                  ? IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: _deleteItem,
                    )
                  : IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: _toggleEditing,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
