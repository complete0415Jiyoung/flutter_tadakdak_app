import 'package:flutter/material.dart';
import 'package:tadaktak_app/core/styles/app_text_styles.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';
import 'package:tadaktak_app/presentation/component/coustom_app_bar.dart';
import 'package:tadaktak_app/presentation/component/game_timer.dart';
import 'package:tadaktak_app/presentation/component/preview_box.dart';
import 'package:tadaktak_app/presentation/component/progress_bar.dart';
import 'package:tadaktak_app/presentation/component/sentence_input_box.dart';
import 'package:tadaktak_app/presentation/component/sentence_title.dart';
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
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // build가 끝난 후 포커스 요청
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(); // 필요하다면
    return Scaffold(
      backgroundColor: ColorStyles.purple900,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: '장문연습',
              onClose: () {
                /* ... */
              },
            ),

            // 진행바
            ProgressBar(progress: 0.6),
            const SizedBox(height: 20),

            // 타자 타입과 제목
            SentenceTitle(typeLabel: '랜덤장문', titleText: '둥글게 둥글게'),
            const SizedBox(height: 20),

            // 타이머
            GameTimer(time: '00:00', wpm: '230', percent: '99%'),
            const SizedBox(height: 20),

            // Play Layout
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(color: ColorStyles.purple200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    // 입력창
                    SentenceInputBox(
                      question: '손뼉을 치면서 노래를 부르며',
                      focusNode: _focusNode,
                      controller: controller,
                    ),

                    const SizedBox(height: 20),

                    // 미리보기
                    PreviewBox(
                      previewLines: ['랄라랄라 즐겁게 춤추자', '딩가딩가 딩가딩가딩 딩가딩가 딩가딩가딩'],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
