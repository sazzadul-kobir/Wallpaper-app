import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/screens/category.dart';
import 'package:wallpaper_app/view/screens/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoryScreen(),
    );
  }
}


