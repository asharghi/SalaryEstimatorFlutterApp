import 'package:app/ui/screens/home_screen.dart';
import 'package:app/ui/screens/loading_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const HomeScreen(),
  '/loading': (context) => const LoadingScreen(),
};
