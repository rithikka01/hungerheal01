import 'package:flutter/material.dart';
import 'intro_page.dart'; // Ensure this file is in the same directory

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HungerHeal',
      theme: ThemeData.dark(), // Set the theme to dark mode
      home: IntroPage(),
    );
  }
}
