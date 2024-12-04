import 'package:flutter/material.dart';

class YellowScreen extends StatelessWidget {
  const YellowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text('Yellow Screen'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      _navigateToFeature(context, "Feature 1");
                    },
                    child: const Text('Button 1'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
          
                      _navigateToFeature(context, "Feature 2");
                    },
                    child: const Text('Button 2'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                    
                      _navigateToFeature(context, "Feature 3");
                    },
                    child: const Text('Button 3'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  void _navigateToFeature(BuildContext context, String featureName) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Navigating to $featureName...')),
    );
  }
}
