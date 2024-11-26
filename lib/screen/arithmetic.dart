import 'package:flutter/material.dart';

class Arithmetic extends StatefulWidget {
  const Arithmetic({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ArithmeticState createState() => _ArithmeticState();
}

class _ArithmeticState extends State<Arithmetic> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  String result = "";

  void performOperation(String operation) {
    double num1 = double.tryParse(num1Controller.text) ?? 0.0;
    double num2 = double.tryParse(num2Controller.text) ?? 0.0;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arithmetic Operations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: num1Controller,
              decoration: const InputDecoration(labelText: 'First Number'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: num2Controller,
              decoration: const InputDecoration(labelText: 'Second Number'),
              keyboardType: TextInputType.number,
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
    );
  }
}
