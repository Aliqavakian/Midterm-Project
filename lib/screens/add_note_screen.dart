import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers.dart';
import '../models/note.dart';
import '../providers/notes_provider.dart';


class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Note')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: 'Content'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text.trim();
                final content = _contentController.text.trim();

                if (title.isNotEmpty && content.isNotEmpty) {
                  final note = Note(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: title,
                    content: content,
                  );

                  Provider.of<NotesProvider>(context, listen: false)
                      .addNote(note);

                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields')),
                  );
                }
              },
              child: const Text('Add Note'),
            ),
          ],
        ),
      ),
    );
  }
}
