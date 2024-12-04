import 'package:flutter/material.dart';
import 'dart:math';

class AreaOfCircle extends StatefulWidget {
  const AreaOfCircle({super.key});

  @override
  _AreaOfCircleState createState() => _AreaOfCircleState();
}

class _AreaOfCircleState extends State<AreaOfCircle> {
  final TextEditingController radiusController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String result = "";

  void calculateArea() {
    if (_formKey.currentState?.validate() ?? false) {
      // Proceed only if validation passes
      double radius = double.parse(radiusController.text.trim());
      double area = pi * radius * radius;

      setState(() {
        result = "Area: ${area.toStringAsFixed(2)} square units";
      });
    } else {
      setState(() {
        result = ""; // Clear result if validation fails
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area of Circle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: radiusController,
                decoration: const InputDecoration(
                  labelText: 'Radius',
                  hintText: 'Enter a number',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the number';
                  }
                  double? radius = double.tryParse(value.trim());
                  if (radius == null || radius <= 0) {
                    return 'Please enter a valid positive number';
                  }
                  return null;
                },
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
      ),
    );
  }
}
