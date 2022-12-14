import 'package:astera/presentation/landing_page.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astera',
      theme: FlexThemeData.dark(
        useMaterial3: true,
        scheme: FlexScheme.deepBlue,
      ),
      darkTheme: FlexThemeData.dark(
        useMaterial3: true,
        scheme: FlexScheme.deepBlue,
      ),
      home: const LanndingPage(),
    );
  }
}
