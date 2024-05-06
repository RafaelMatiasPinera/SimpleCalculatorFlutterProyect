import 'package:flutter/material.dart';
import 'package:simplecalculatorflutterproyect/pages/Calculator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Calculator(),
      routes: {
        '/Calculator': (context) => const Calculator(),
      }, //requires a children of widgets
    );
  }
}
