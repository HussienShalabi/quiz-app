import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Quiz app',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
