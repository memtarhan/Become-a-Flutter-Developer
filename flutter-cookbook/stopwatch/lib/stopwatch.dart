import 'dart:async';

import 'package:flutter/material.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => StopwatchState();
}

class StopwatchState extends State<Stopwatch> {
  bool isTicking = false;
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

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), onTrick);
    setState(() {
      seconds = 0;
      isTicking = true;
    });
  }

  void _stopTimer() {
    setState(() {
      isTicking = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stopwatch')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$seconds ${_secondsText()}',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall,
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(12), child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.green),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white),
                  ),
                  onPressed: isTicking ? null : _startTimer,
                  child: const Text('Start'),
                ),),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.red),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.white),
                    ),
                    onPressed: isTicking ? _stopTimer : null,
                    child: const Text('Stop'),
                  ),
                )
              ],
            )
          ]
      ),
    );
  }

  String _secondsText() => seconds == 1 ? 'second' : 'seconds';
}
