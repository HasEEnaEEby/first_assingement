import 'package:flutter/material.dart';

class Arithmetic extends StatelessWidget {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  String result = "";

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
                  onPressed: () {
                    double num1 = double.parse(num1Controller.text);
                    double num2 = double.parse(num2Controller.text);
                    double sum = num1 + num2;
                    result = "Sum: \$${sum.toStringAsFixed(2)}";
                  },
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () {
                    double num1 = double.parse(num1Controller.text);
                    double num2 = double.parse(num2Controller.text);
                    double diff = num1 - num2;
                    result = "Difference: \$${diff.toStringAsFixed(2)}";
                  },
                  child: const Text('Subtract'),
                ),
                ElevatedButton(
                  onPressed: () {
                    double num1 = double.parse(num1Controller.text);
                    double num2 = double.parse(num2Controller.text);
                    double prod = num1 * num2;
                    result = "Product: \$${prod.toStringAsFixed(2)}";
                  },
                  child: const Text('Multiply'),
                ),
                ElevatedButton(
                  onPressed: () {
                    double num1 = double.parse(num1Controller.text);
                    double num2 = double.parse(num2Controller.text);
                    double div = num1 / num2;
                    result = "Division: \$${div.toStringAsFixed(2)}";
                  },
                  child: const Text('Divide'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(result),
          ],
        ),
      ),
    );
  }
}
