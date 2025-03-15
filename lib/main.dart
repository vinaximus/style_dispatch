import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:style_dispatch/services/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Database db = await DatabaseService.instance.getDatabase;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
