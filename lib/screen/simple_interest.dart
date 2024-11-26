import 'package:flutter/material.dart';

class SimpleInterest extends StatelessWidget {
  final TextEditingController principalController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  String result = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: principalController,
              decoration: const InputDecoration(labelText: 'Principal'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: rateController,
              decoration: const InputDecoration(labelText: 'Rate of Interest'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: timeController,
              decoration: const InputDecoration(labelText: 'Time (years)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double principal = double.parse(principalController.text);
                double rate = double.parse(rateController.text);
                double time = double.parse(timeController.text);
                double simpleInterest = (principal * rate * time) / 100;
                result = "Simple Interest: \$${simpleInterest.toStringAsFixed(2)}";
              },
              child:const Text('Calculate Simple Interest'),
            ),
            const SizedBox(height: 20),
            Text(result),
          ],
        ),
      ),
    );
  }
}
