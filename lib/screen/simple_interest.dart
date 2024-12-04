import 'package:flutter/material.dart';

class SimpleInterest extends StatefulWidget {
  const SimpleInterest({super.key});

  @override
  SimpleInterestState createState() => SimpleInterestState();
}

class SimpleInterestState extends State<SimpleInterest> {
  final TextEditingController principalController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String result = "";

  void calculateSimpleInterest() {
    if (_formKey.currentState?.validate() ?? false) {
      double principal = double.parse(principalController.text.trim());
      double rate = double.parse(rateController.text.trim());
      double time = double.parse(timeController.text.trim());

      double simpleInterest = (principal * rate * time) / 100;
      setState(() {
        result = "Simple Interest: \$${simpleInterest.toStringAsFixed(2)}";
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
        title:RichText
        (text: const TextSpan(
          children:[
            TextSpan(
              text: "Simple",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple,
              ),
            ),
            TextSpan(
              text: 'Interest',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.blue,
              ),
            ),

            TextSpan(
              text: 'Calculator',
              style: TextStyle(
                fontSize: 20,
                color: Colors.amber,

              ),
            ),
            TextSpan(
              text: 'The simple calculator'
            )
          ] 

        ))
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: principalController,
                decoration: const InputDecoration(
                  labelText: 'Principal',
                  hintText: 'Enter principal amount',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the principal amount';
                  }
                  if (double.tryParse(value.trim()) == null) {
                    return 'Enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: rateController,
                decoration: const InputDecoration(
                  labelText: 'Rate of Interest (%)',
                  hintText: 'Enter annual interest rate',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the rate of interest';
                  }
                  if (double.tryParse(value.trim()) == null) {
                    return 'Enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: timeController,
                decoration: const InputDecoration(
                  labelText: 'Time (years)',
                  hintText: 'Enter time in years',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the time period';
                  }
                  if (double.tryParse(value.trim()) == null) {
                    return 'Enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: calculateSimpleInterest,
                  child: const Text('Calculate Simple Interest'),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  result,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
