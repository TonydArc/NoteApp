import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Readfile extends StatefulWidget {
  const Readfile({Key? key}) : super(key: key);

  @override
  _ReadfileState createState() => _ReadfileState();
}

class _ReadfileState extends State<Readfile> {
  String text = '';

  Future<void> loadfilecontent() async {
    String data = await rootBundle.loadString('assets/text.txt');
    setState(() {
      text = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  loadfilecontent();
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  width: double.infinity,
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      'Load File Data',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(text),
              )
            ],
          ),
        ),
      ),
    );
  }
}
