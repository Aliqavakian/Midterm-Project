import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Notes_provider.dart';
import 'Providers.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NotesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const NotesListScreen(),
      ),
    );
  }
}
