import 'package:flutter/material.dart';

class SimpleInterest extends StatefulWidget {
  @override
  _SimpleInterestState createState() => _SimpleInterestState();
}

class _SimpleInterestState extends State<SimpleInterest> {
  final TextEditingController principalController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  String result = "";

  void calculateSimpleInterest() {
    double principal = double.tryParse(principalController.text) ?? 0.0;
    double rate = double.tryParse(rateController.text) ?? 0.0;
    double time = double.tryParse(timeController.text) ?? 0.0;

    double simpleInterest = (principal * rate * time) / 100;
    setState(() {
      result = "Simple Interest: \$${simpleInterest.toStringAsFixed(2)}";
    });
  }

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
              onPressed: calculateSimpleInterest,
              child: const Text('Calculate Simple Interest'),
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
