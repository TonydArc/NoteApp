import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // number 1
  int _number1 = 5;
  // number 2
  int _number2 = 3;
  // sum
  int _sum = 0;

  void letsum() async {
    setState(() {
      _sum = _number2 + _number1;
    });
    print(_sum);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Text('flutter la ngon ngu lap trinh da nen tang'),
          ),
          Center(
              child: Text(
            'Red sun, red sun over paradise',
            style: TextStyle(fontSize: 30, color: Colors.deepPurple),
          )),
          Container(
            child: Center(
              child: Text('$_number1'),
            ),
          ),
          Container(
            child: Center(
              child: Text('$_number2'),
            ),
          ),
          Center(child: TextButton(onPressed: letsum, child: Text('sum'))),
          Center(
            child: Text('$_sum'),
          )
        ],
      ),
    );
  }
}
