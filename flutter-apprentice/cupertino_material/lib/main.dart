import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'cupertino_screen.dart';
import 'android_screen.dart';

void main() {
  runApp(PlatformSelectionApp());
}

class PlatformSelectionApp extends StatelessWidget {
  const PlatformSelectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive UI Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PlatformSelectionScreen(),
    );
  }
}

class PlatformSelectionScreen extends StatelessWidget {
  const PlatformSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Platform')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AndroidScreen()),
                );
              },
              child: Text('Material Design (Android)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CupertinoApp(
                        theme: CupertinoThemeData(brightness: Brightness.light),
                        home: CupertinoScreen(),
                      );
                    },
                  ),
                );
              },
              child: Text('Cupertino (iOS)'),
            ),
          ],
        ),
      ),
    );
  }
}