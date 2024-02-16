import 'package:flutter/material.dart';
import 'package:flutter_regular_expression/test_reg_exp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RegularExpression',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RegularExpression'),
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        body: const TestRegExp(),
      ),
    );
  }
}
