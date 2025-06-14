import 'package:flutter/material.dart';

import './stopwatch.dart';

void main() => runApp(const StopwatchApp());

class StopwatchApp extends StatelessWidget {
  const StopwatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Stopwatch());
  }
}
