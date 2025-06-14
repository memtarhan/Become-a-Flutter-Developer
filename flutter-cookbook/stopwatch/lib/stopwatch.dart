import 'dart:async';

import 'package:flutter/material.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => StopwatchState();
}

class StopwatchState extends State<Stopwatch> {
  int seconds = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), onTrick);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void onTrick(Timer time) {
    if (mounted) {
      setState(() {
        ++seconds;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stopwatch')),
      body: Center(
        child: Text(
          '$seconds ${_secondsText()}',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }

  String _secondsText() => seconds == 1 ? 'second' : 'seconds';
}
