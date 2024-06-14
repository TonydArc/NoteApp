import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Micard extends StatefulWidget {
  const Micard({Key? key}) : super(key: key);

  @override
  _MicardState createState() => _MicardState();
}

class _MicardState extends State<Micard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(256),
              child: Image.asset(
                'assets/bocchi.jpg',
                height: 150,
                width: 150,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Ho Quoc An',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          SizedBox(
            height: 20,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(16),
          //         color: Colors.white,
          //       ),
          //       height: 50,
          //       width: 325,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           Icon(Icons.email),
          //           Text(
          //             'tonyking497@gmail.com',
          //             style: TextStyle(fontSize: 20),
          //           )
          //         ],
          //       ),
          //     )
          //   ],
          // ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.deepPurple,
              ),
              title: Center(
                child: Text(
                  '0383 49 50 70',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.deepPurple,
              ),
              title: Center(
                child: Text(
                  'hoquocan@gmail.com',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
