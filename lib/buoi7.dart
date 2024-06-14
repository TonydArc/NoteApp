import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Buoi7 extends StatefulWidget {
  const Buoi7({Key? key}) : super(key: key);

  @override
  _Buoi7State createState() => _Buoi7State();
}

class _Buoi7State extends State<Buoi7> {
  final TextEditingController _hoten = TextEditingController();
  final TextEditingController _money = TextEditingController();
  final TextEditingController _laisuat = TextEditingController();

  int option1 = 12;
  int option2 = 24;
  int option3 = 36;

  int selectvalue = 12;

  double lai = 0;

  String textname = '';
  int textmoney = 0;
  double currentlaisuat = 0;

  void onchangeName() {
    setState(() {
      textname = _hoten.text;
    });
  }

  void onchangeMoney() {
    setState(() {
      textmoney = int.parse(_money.text);
      lai = (textmoney / selectvalue) * (currentlaisuat / 100);
    });
  }

  void onchangeLaisuat() {
    setState(() {
      currentlaisuat = double.parse(_laisuat.text);
      lai = (textmoney / selectvalue) * (currentlaisuat / 100);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(right: 20, left: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12)),
            child: TextField(
              controller: _hoten,
              keyboardType: TextInputType.name,
              onChanged: (value) {
                onchangeName();
              },
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Ho va ten'),
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
              controller: _money,
              onChanged: (value) {
                onchangeMoney();
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Tien vay'),
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
              controller: _laisuat,
              onChanged: (value) {
                onchangeLaisuat();
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Lai suat'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              RadioListTile<int>(
                title: const Text('12 thang'),
                value: option1,
                groupValue: selectvalue,
                onChanged: (int? value) {
                  setState(() {
                    selectvalue = value!;
                    lai = (textmoney / selectvalue) * (currentlaisuat / 100);
                  });
                },
              ),
              RadioListTile<int>(
                title: const Text('24 thang'),
                value: option2,
                groupValue: selectvalue,
                onChanged: (int? value) {
                  setState(() {
                    selectvalue = value!;
                    lai = (textmoney / selectvalue) * (currentlaisuat / 100);
                  });
                },
              ),
              RadioListTile<int>(
                title: const Text('36 thang'),
                value: option3,
                groupValue: selectvalue,
                onChanged: (int? value) {
                  setState(() {
                    selectvalue = value!;
                    lai = (textmoney / selectvalue) * (currentlaisuat / 100);
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            title: Text('Ho va ten: $textname'),
          ),
          ListTile(
            title: Text('Tien lai/thang $lai'),
          ),
          ListTile(
            title: Text('So thang vay: $selectvalue'),
          ),
        ],
      ),
    );
  }
}
