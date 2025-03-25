import 'package:flutter/material.dart';
import 'package:style_dispatch/screens/styles/style_manager_screen.dart';
import 'package:style_dispatch/services/theme_service.dart';

ThemeData currentThemeLight = initTheme();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Style Dispatch',
      theme: currentThemeLight,
      home: Scaffold(
        body: Center(child: StyleManagerScreen()),
      ),
    );
  }
}
