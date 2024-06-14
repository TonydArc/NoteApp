import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class Test2 extends StatefulWidget {
  const Test2({Key? key}) : super(key: key);

  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  final TextEditingController _a = TextEditingController();
  final TextEditingController _b = TextEditingController();
  final TextEditingController _c = TextEditingController();

  double delta = 0; // Biến delta
  int result = 0; // Biến result

  String suyra = '';

// Hàm tính toán delta
  void giai() {
    // Lấy giá trị từ các ô nhập liệu và chuyển đổi thành số thực
    double a = double.tryParse(_a.text) ?? 0;
    double b = double.tryParse(_b.text) ?? 0;
    double c = double.tryParse(_c.text) ?? 0;

    // Tính delta theo công thức b^2 - 4ac
    delta = pow(b, 2) - 4 * a * c;

    if (delta < 0) {
      suyra = 'PT vo nghiem';
    } else if (delta == 0) {
      double nghiemkep = -b / 2 * a;
      suyra = 'PT co nghiem kep x1 = x2 = $nghiemkep';
    } else if (delta > 0) {
      double x1 = -b + sqrt(delta) / 2 * a;
      double x2 = -b - sqrt(delta) / 2 * a;
      suyra = 'PT co 2 nghiem pb x1 = $x1 va x2 = $x2';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Giai PT bac 2',
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // a
            Container(
              margin: EdgeInsets.only(right: 20, left: 20),
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)),
              child: TextField(
                controller: _a,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'nhap a'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // b
            Container(
              margin: EdgeInsets.only(right: 20, left: 20),
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)),
              child: TextField(
                controller: _b,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'nhap b'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // c
            Container(
              margin: EdgeInsets.only(right: 20, left: 20),
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)),
              child: TextField(
                controller: _c,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'nhap c'),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                giai();
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
                    'Giai PT',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Δ=b^2-4ac = $delta',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Suy ra: $suyra',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
