import 'package:flutter/material.dart';
import 'package:tadaktak_app/presentation/screen/long_sentence/long_sentence_view_model.dart';
import 'package:tadaktak_app/presentation/screen/long_sentence/screen/long_sentence_screen.dart';

class LongSentenceScreenRoot extends StatefulWidget {
  final LongSentenceViewModel viewModel;
  const LongSentenceScreenRoot({super.key, required this.viewModel});

  @override
  State<LongSentenceScreenRoot> createState() => _HomeScreenRootState();
}

class _HomeScreenRootState extends State<LongSentenceScreenRoot> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return LongSentenceScreen();
      },
    );
  }
}
