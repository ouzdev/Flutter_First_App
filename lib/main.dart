import 'package:flutter/material.dart';
import 'package:flutter_first_app/random_word.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: RandomWords(),
        ),
        body: Center(
          child: Container(child: RandomWords()),
        ),
      ),
    );
  }
}
