import 'package:flutter/cupertino.dart';

class CupertinoScreen extends StatefulWidget {
  const CupertinoScreen({super.key});

  @override
  State<CupertinoScreen> createState() => _CupertinoScreenState();
}

class _CupertinoScreenState extends State<CupertinoScreen> {
  bool _switchValue = false;
  bool? _checkboxValue = false;
  double _sliderValue = 50;
  int? _selectedSegment = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Cupertino Example')),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CupertinoTextField(placeholder: 'Enter text'),
              CupertinoSwitch(
                value: _switchValue,
                onChanged: (bool value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),
              CupertinoSlider(
                value: _sliderValue,
                min: 0,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
              CupertinoCheckbox(
                value: _checkboxValue,
                onChanged: (bool? value) {
                  setState(() {
                    _checkboxValue = value;
                  });
                },
              ),
              CupertinoSegmentedControl(
                groupValue: _selectedSegment,
                children: {
                  0: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Option 1'),
                  ),
                  1: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Option 2'),
                  ),
                  2: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Option 3'),
                  ),
                },
                onValueChanged: (value) {
                  setState(() {
                    _selectedSegment = value;
                  });
                },
              ),
              CupertinoButton(
                child: Text('Show AlertDialog'),
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text('Cupertino Alert'),
                        content: Text('This is a CupertinoAlertDialog.'),
                        actions: [
                          CupertinoDialogAction(
                            isDestructiveAction: true,
                            child: Text('CANCEL'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            child: Text('OK'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
