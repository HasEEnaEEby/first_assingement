import 'package:first_assingement/screen/dashboard.dart';
import 'package:flutter/material.dart';
 // Import the dashboard screen

void main() {
  runApp(
    const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
    );
  }
}
