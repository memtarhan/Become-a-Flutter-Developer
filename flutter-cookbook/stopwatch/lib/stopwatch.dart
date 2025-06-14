import 'dart:async';

import 'package:flutter/material.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => StopwatchState();
}

class StopwatchState extends State<Stopwatch> {
  final laps = <int>[];

  bool isTicking = false;
  int milliseconds = 0;
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
        milliseconds += 100;
      });
    }
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 100), onTrick);
    setState(() {
      milliseconds = 0;
      isTicking = true;
      laps.clear();
    });
  }

  void _stopTimer() {
    setState(() {
      isTicking = false;
    });
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stopwatch')),
      body: Column(
        children: [
          Expanded(child: _buildCounter(context)),
          Expanded(child: _buildLapDisplay()),
        ],
      ),
    );
  }

  Widget _buildLapDisplay() {
    return ListView(
      children: [
        for (int milliseconds in laps)
          ListTile(
            title: Text(_secondsText(milliseconds)),
          )
      ],
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme
          .of(context)
          .primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Lap ${laps.length + 1}',
            style: Theme
                .of(context)
                .textTheme
                .headlineLarge,
          ),
          Text(
            _secondsText(milliseconds),
            style: Theme
                .of(context)
                .textTheme
                .headlineMedium
          ),
          _buildControls(),
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Colors.green),
            foregroundColor: MaterialStateProperty.all<Color>(
                Colors.white),
          ),
          onPressed: isTicking ? null : _startTimer,
          child: const Text('Start'),
        ),

        const SizedBox(width: 20),

        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.yellow),
          ),
          onPressed: isTicking ? _lap : null,
          child: const Text('Lap'),
        ),
        SizedBox(width: 20),

        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Colors.red),
            foregroundColor: MaterialStateProperty.all<Color>(
                Colors.white),
          ),
          onPressed: isTicking ? _stopTimer : null,
          child: const Text('Stop'),
        ),
      ],
    );
  }

  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }
}
