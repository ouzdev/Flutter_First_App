import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final word = WordPair.random();
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text(word.asCamelCase),
        ),
        body: Center(
          child: Container(child: Text(word.asPascalCase)),
        ),
      ),
    );
  }
}
