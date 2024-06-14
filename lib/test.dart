import 'package:flutter/material.dart';
import 'package:flutter_buoi1/test2.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  double _result = 0;

  void _calculate(String operation) {
    double num1 = double.tryParse(_num1Controller.text) ?? 0;
    double num2 = double.tryParse(_num2Controller.text) ?? 0;

    switch (operation) {
      case '+':
        _result = num1 + num2;
        break;
      case '-':
        _result = num1 - num2;
        break;
      case '*':
        _result = num1 * num2;
        break;
      case '/':
        if (num2 == 0) {
          _result = double.nan;
        } else {
          _result = num1 / num2;
        }
        break;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 20, left: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12)),
            child: TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'enter first number'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(right: 20, left: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12)),
            child: TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'enter second number'),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _calculate('+'),
                child: Text('+'),
              ),
              ElevatedButton(
                onPressed: () => _calculate('-'),
                child: Text('-'),
              ),
              ElevatedButton(
                onPressed: () => _calculate('*'),
                child: Text('*'),
              ),
              ElevatedButton(
                onPressed: () => _calculate('/'),
                child: Text('/'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Ket qua: $_result',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Test2()),
                );
              },
              child: Text(
                'Go to bt 3',
                style: TextStyle(fontSize: 20, color: Colors.deepPurple),
              ),
            ),
          )
        ],
      ),
    );
  }
}
