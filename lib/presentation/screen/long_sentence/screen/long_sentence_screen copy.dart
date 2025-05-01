import 'package:flutter/material.dart';
import 'package:tadaktak_app/core/styles/app_text_styles.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';
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
    return Scaffold(
      backgroundColor: ColorStyles.purple900,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              // AppBar
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '장문연습',
                    style: AppTextStyles.headerBold(color: ColorStyles.white),
                  ),
                  GestureDetector(
                    child: Icon(Icons.close, color: ColorStyles.white),
                  ),
                ],
              ),
            ),

            // 진행바
            Container(
              width: double.infinity,
              height: 10,
              decoration: BoxDecoration(color: ColorStyles.gray4),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 0.60, // 진행도 (0.0 ~ 1.0)
                child: Container(
                  decoration: BoxDecoration(color: Color(0xFF7E6BFF)),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 타자 타입과 제목
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: ColorStyles.gray400,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      '램덤장문',
                      style: AppTextStyles.smallBold(
                        color: ColorStyles.bcWhite,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '둥글게 둥글게',
                    style: AppTextStyles.largeBold(color: ColorStyles.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 타이머
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '00:00',
                    style: AppTextStyles.largeBold(color: ColorStyles.white),
                  ),
                  Text(
                    '230',
                    style: AppTextStyles.headerBold(
                      color: ColorStyles.purple100,
                    ),
                  ),
                  Text(
                    '99%',
                    style: AppTextStyles.largeBold(color: ColorStyles.white),
                  ),
                ],
              ),
            ),
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
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: ColorStyles.purple100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: double.infinity,
                      child: Text(
                        '손뼉을 치면서 노래를 부르며',
                        style: AppTextStyles.mediumRegular().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      focusNode: _focusNode,
                      style: AppTextStyles.mediumRegular(
                        color: ColorStyles.black,
                      ).copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        filled: false,
                        hintText: '',
                      ),
                    ),

                    // 미리보기
                    const SizedBox(height: 20),

                    Text(
                      '랄라랄라 즐겁게 춤추자',
                      style: AppTextStyles.mediumRegular(
                        color: ColorStyles.gray300,
                      ),
                    ),
                    Text(
                      '딩가딩가 딩가딩가딩 딩가딩가 딩가딩가딩',
                      style: AppTextStyles.mediumRegular(
                        color: ColorStyles.gray300,
                      ),
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
