import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final wordPair = WordPair.random();
    return MaterialApp(title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
//          child: Text('Hello == World'),
//          child: Text(wordPair.asPascalCase),
          child: RandomWords(),
        ),
      ),
    );
  }
}

class Person{

  int age;
  String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Person &&
              runtimeType == other.runtimeType &&
              age == other.age;

  @override
  int get hashCode => age.hashCode;


}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }

  Widget label() {
//    if (this.isRich) {
      return Text.rich(TextSpan(children: [
        TextSpan(text: '大江东去，浪淘尽，千古风流人物。'),
        TextSpan(
          text: '故垒西边，人道是，三国周郎赤壁。',
          style: TextStyle(color: Colors.blue),
        ),
        TextSpan(
          text: '乱石穿空，惊涛拍岸，卷起千堆雪。',
          style: TextStyle(
            ///< 奇怪的语法：const TextDecoration._(this._mask);
              decoration: TextDecoration.overline,
              decorationStyle: TextDecorationStyle.solid,
              decorationColor: Colors.red,
              color: Colors.blue),
        ),
        TextSpan(
          text: '江山如画，一时多少豪杰。',
          style: TextStyle(
            color: Colors.blue,
            shadows: [
              Shadow(color: Colors.red, offset: Offset(1, 1), blurRadius: 2)
            ],
          ),
        ),
        TextSpan(
          text: '遥想公瑾当年，小乔初嫁了，雄姿英发。'
              '羽扇纶巾，谈笑间，樯橹灰飞烟灭。',
          style: TextStyle(
            color: Colors.blue,
            backgroundColor: Colors.brown,
          ),
        ),
        TextSpan(
          text: '故国神游，多情应笑我，早生华发。',
          recognizer: null,
          style: TextStyle(color: Colors.red, fontSize: 18),
        ),
      ]));
//    } else {
//      return Text(
//        '大江东去，浪淘尽，千古风流人物。'
//            '故垒西边，人道是，三国周郎赤壁。'
//            '乱石穿空，惊涛拍岸，卷起千堆雪。'
//            '江山如画，一时多少豪杰。'
//            '遥想公瑾当年，小乔初嫁了，雄姿英发。'
//            '羽扇纶巾，谈笑间，樯橹灰飞烟灭。'
//            '故国神游，多情应笑我，早生华发。',
//        softWrap: true,
//      );
//    }
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RandomWordsState();
  }
}
