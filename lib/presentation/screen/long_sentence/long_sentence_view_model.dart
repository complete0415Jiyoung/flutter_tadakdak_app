import 'package:flutter/foundation.dart';
import 'package:tadaktak_app/presentation/screen/long_sentence/action/long_sentence_action.dart';
import 'package:tadaktak_app/presentation/screen/long_sentence/state/long_sentence_state.dart';

class LongSentenceViewModel with ChangeNotifier {
  final LongSentenceState _state = LongSentenceState();
  LongSentenceState get state => _state;

  void onAction(LongSentenceAction action) {
    // 액션별 분기 추가
  }
}
