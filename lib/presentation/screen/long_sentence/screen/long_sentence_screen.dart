import 'package:flutter/material.dart';
import 'package:tadaktak_app/presentation/screen/long_sentence/action/long_sentence_action.dart';
import 'package:tadaktak_app/presentation/screen/long_sentence/state/long_sentence_state.dart';

class LongSentenceScreen extends StatefulWidget {
  final LongSentenceState state;
  final void Function(LongSentenceAction action) onAction;

  const LongSentenceScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  State<LongSentenceScreen> createState() => _LongSentenceScreenState();
}

class _LongSentenceScreenState extends State<LongSentenceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('장문 연습하기')));
  }
}
