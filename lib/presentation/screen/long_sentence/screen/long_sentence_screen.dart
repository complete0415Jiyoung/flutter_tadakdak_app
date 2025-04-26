import 'package:flutter/material.dart';

class LongSentenceScreen extends StatefulWidget {
  const LongSentenceScreen({super.key});

  @override
  State<LongSentenceScreen> createState() => _LongSentenceScreenState();
}

class _LongSentenceScreenState extends State<LongSentenceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('장문 연습하기')));
  }
}
