import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CircleAreaCalculator(),
    );
  }
}

class CircleAreaCalculator extends StatefulWidget {
  @override
  _CircleAreaCalculatorState createState() => _CircleAreaCalculatorState();
}

class _CircleAreaCalculatorState extends State<CircleAreaCalculator> {
  final TextEditingController _radiusController = TextEditingController();
  double _area = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Area Calculator', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _radiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Radius (meters)'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateArea, style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Button color
                  textStyle: TextStyle(color: Colors.white), // Text color
                ),
              child: Text('Calculate Area'),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateArea() {
    double radius = double.tryParse(_radiusController.text) ?? 0.0;
    double area = pi * pow(radius, 2);
    _showResultDialog(area);
  }

  void _showResultDialog(double area) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Result'),
          content: Text(
              'The area of the circle is ${area.toStringAsFixed(2)} square meters.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
