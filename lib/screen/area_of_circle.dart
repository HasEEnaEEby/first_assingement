import 'package:flutter/material.dart';
import 'dart:math';

class AreaOfCircle extends StatelessWidget {
  final TextEditingController radiusController = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Area of Circle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: radiusController,
              decoration: InputDecoration(labelText: 'Radius'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double radius = double.parse(radiusController.text);
                double area = pi * radius * radius;
                result = "Area: ${area.toStringAsFixed(2)} square units";
              },
              child: Text('Calculate Area of Circle'),
            ),
            SizedBox(height: 20),
            Text(result),
          ],
        ),
      ),
    );
  }
}
