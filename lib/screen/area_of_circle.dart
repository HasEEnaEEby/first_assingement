import 'package:flutter/material.dart';
import 'dart:math';

class AreaOfCircle extends StatefulWidget {
  const AreaOfCircle({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AreaOfCircleState createState() => _AreaOfCircleState();
}

class _AreaOfCircleState extends State<AreaOfCircle> {
  final TextEditingController radiusController = TextEditingController();
  String result = "";

  void calculateArea() {
    double radius = double.tryParse(radiusController.text) ?? 0.0;
    double area = pi * radius * radius;

    setState(() {
      result = "Area: ${area.toStringAsFixed(2)} square units";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area of Circle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: radiusController,
              decoration: const InputDecoration(labelText: 'Radius'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateArea,
              child: const Text('Calculate Area'),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
