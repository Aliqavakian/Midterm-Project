import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notes_provider.dart';
import 'Providers.dart';
import 'screens/add_note_screen.dart';

class NotesListScreen extends StatelessWidget {
  const NotesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use Consumer or Provider.of to listen for changes
    final notesProvider = Provider.of<NotesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: notesProvider.notes.length,
        itemBuilder: (context, index) {
          final note = notesProvider.notes[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddNoteScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
