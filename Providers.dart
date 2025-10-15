import 'package:flutter/foundation.dart'; // ensures ChangeNotifier works
import '../models/note.dart';

class NotesProvider extends ChangeNotifier {
  final List<Note> _notes = [];

  // Expose an unmodifiable list to prevent external modification
  List<Note> get notes => List.unmodifiable(_notes);

  // Add a note and notify listeners
  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  // Optional: remove a note
  void removeNote(Note note) {
    _notes.remove(note);
    notifyListeners();
  }

  // Optional: clear all notes
  void clearNotes() {
    _notes.clear();
    notifyListeners();
  }
}
