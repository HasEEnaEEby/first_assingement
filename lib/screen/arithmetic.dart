import 'package:flutter/material.dart';

class Arithmetic extends StatefulWidget {
  const Arithmetic({super.key});

  @override
  ArithmeticState createState() => ArithmeticState();
}

class ArithmeticState extends State<Arithmetic> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String result = "";

  void performOperation(String operation) {
    if (_formKey.currentState?.validate() ?? false) {
      double num1 = double.parse(num1Controller.text.trim());
      double num2 = double.parse(num2Controller.text.trim());
      double calcResult;

      switch (operation) {
        case 'add':
          calcResult = num1 + num2;
          result = "Sum: ${calcResult.toStringAsFixed(2)}";
          break;
        case 'subtract':
          calcResult = num1 - num2;
          result = "Difference: ${calcResult.toStringAsFixed(2)}";
          break;
        case 'multiply':
          calcResult = num1 * num2;
          result = "Product: ${calcResult.toStringAsFixed(2)}";
          break;
        case 'divide':
          calcResult = num2 != 0 ? num1 / num2 : double.infinity;
          result = num2 != 0
              ? "Division: ${calcResult.toStringAsFixed(2)}"
              : "Cannot divide by zero";
          break;
      }

      setState(() {});
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
        title: const Text('Arithmetic Operations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: num1Controller,
                decoration: const InputDecoration(
                  labelText: 'First Number',
                  hintText: 'Enter a number',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the first number';
                  }
                  if (double.tryParse(value.trim()) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: num2Controller,
                decoration: const InputDecoration(
                  labelText: 'Second Number',
                  hintText: 'Enter a number',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the second number';
                  }
                  if (double.tryParse(value.trim()) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => performOperation('add'),
                    child: const Text('Add'),
                  ),
                  ElevatedButton(
                    onPressed: () => performOperation('subtract'),
                    child: const Text('Subtract'),
                  ),
                  ElevatedButton(
                    onPressed: () => performOperation('multiply'),
                    child: const Text('Multiply'),
                  ),
                  ElevatedButton(
                    onPressed: () => performOperation('divide'),
                    child: const Text('Divide'),
                  ),
                ],
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
