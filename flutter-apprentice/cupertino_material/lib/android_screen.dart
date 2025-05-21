import 'package:flutter/material.dart';

class AndroidScreen extends StatefulWidget {
  const AndroidScreen({super.key});

  @override
  State<AndroidScreen> createState() => _AndroidScreenState();
}

class _AndroidScreenState extends State<AndroidScreen> {
  bool _switchValue = false;
  bool? _checkboxValue = false;
  double _sliderValue = 50;
  int? _seletedChip = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Material Design Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Enter text')),
            SwitchListTile(
              title: Text('Enable feature'),
              value: _switchValue,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Check this option'),
              value: _checkboxValue,
              onChanged: (bool? value) {
                setState(() {
                  _checkboxValue = value;
                });
              },
            ),
            Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            Wrap(
              spacing: 5.0,
              children:
                  List<Widget>.generate(3, (int index) {
                    return ChoiceChip(
                      label: Text('Item $index'),
                      selected: _seletedChip == index,
                      onSelected: (bool selected) {
                        setState(() {
                          _seletedChip = selected ? index : null;
                        });
                      },
                    );
                  }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Material Alert'),
                      content: Text('This is a Material AlertDialog.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                          ),
                          child: Text('CANCEL'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Show AlertDialog'),
            ),
          ],
        ),
      ),
    );
  }
}
