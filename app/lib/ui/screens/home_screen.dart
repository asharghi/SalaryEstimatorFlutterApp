import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  bool _switchValue = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You have pressed the button $_counter times."),
            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: _incrementCounter,
              child: const Text("+"),
            ),
            Switch(
              value: _switchValue,
              activeColor: Colors.red,
              onChanged: (bool value) {
                // themeChangeProvider.isDarkTheme = value;
                setState(() {
                  _switchValue = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
