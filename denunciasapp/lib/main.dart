import 'package:denunciasapp/config/theme/app_theme.dart';
import 'package:denunciasapp/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Denuncias Ec App',
      theme: AppTheme(selectedColor: 2).theme(),
      home: const HomeScreen(),
    );
  }
}
