import 'package:flutter/material.dart';
import 'package:flutter_buoi1/buoi7.dart';
import 'package:flutter_buoi1/model/note_database.dart';
import 'package:flutter_buoi1/note_app.dart';
import 'package:flutter_buoi1/readfile.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(ChangeNotifierProvider(
    create: (context) => NoteDatabase(),
    child: const Main(),
  ));
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Buoi7(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
