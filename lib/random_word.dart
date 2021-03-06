import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class RandomWords extends StatefulWidget {
  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  int _currentIndex = 0;
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd)
            return Divider(
              color: Colors.black12,
              height: 50,
            ); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return Card(
      child: ListTile(
        enableFeedback: true,
        contentPadding: EdgeInsets.all(15),
        title: Padding(
          padding: const EdgeInsets.all(18.0),
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                pair.asPascalCase.toString(),
                textAlign: TextAlign.center,
                textStyle: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
            totalRepeatCount: 15,
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
        ),
        leading: Icon(
          Icons.short_text,
          size: 45,
        ),
        dense: true,
        selected: false,
        trailing: Icon(Icons.text_fields),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rastgele İngilizce Kelime Oluşturucu'),
      ),
      body: _buildSuggestions(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.text_fields),
              label: "Rastgele Kelime",
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Kelime Ara",
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "Hakkında",
              backgroundColor: Colors.pink),
          BottomNavigationBarItem(
              icon: Icon(Icons.power_settings_new),
              label: "Kapat",
              backgroundColor: Colors.red)
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Icon(Icons.add),
        ),
        onPressed: () {},
        elevation: 10.0,
        tooltip: "Ekle",
      ),
    );
  }
}
