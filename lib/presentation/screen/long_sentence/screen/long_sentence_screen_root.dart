import 'package:flutter/material.dart';
import 'package:tadaktak_app/presentation/screen/long_sentence/long_sentence_view_model.dart';
import 'package:tadaktak_app/presentation/screen/long_sentence/screen/long_sentence_screen.dart';
import 'package:tadaktak_app/presentation/screen/long_sentence/state/long_sentence_state.dart';

class LongSentenceScreenRoot extends StatefulWidget {
  final LongSentenceViewModel viewModel;
  const LongSentenceScreenRoot({super.key, required this.viewModel});

  @override
  State<LongSentenceScreenRoot> createState() => _LongSentenceScreenRootState();
}

class _LongSentenceScreenRootState extends State<LongSentenceScreenRoot> {
  LongSentenceViewModel get viewModel => widget.viewModel;
  LongSentenceState get state => widget.viewModel.state;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return LongSentenceScreen(
          state: widget.viewModel.state,
          onAction: widget.viewModel.onAction,
        );
      },
    );
  }
}
