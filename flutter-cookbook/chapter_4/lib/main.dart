import 'package:chapter_4/basic_screen.dart';
import 'package:flutter/material.dart';

// void main() => runApp(const StaticApp());
void main() {
  runApp(const StaticApp());
}

class StaticApp extends StatelessWidget {
  const StaticApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BasicScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
