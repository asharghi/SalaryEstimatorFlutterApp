import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/theme/default_theme_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.isDarkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  int _counter = 0;
  bool _switchValue = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) {
      return themeChangeProvider;
    }, child: Consumer<DarkThemeProvider>(
      builder: ((context, themeData, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.isDarkTheme, context),
            home: Scaffold(
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
                        themeChangeProvider.isDarkTheme = value;
                        setState(() {
                          _switchValue = value;
                        });
                      },
                    )
                  ],
                ),
              ),
            )
            //routes: routes,
            );
      }),
    ));
  }
}
