import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tadaktak_app/core/styles/app_text_styles.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> with TickerProviderStateMixin {
  // 우리가 타이핑할 때 입력하는 실제 키보드 입력 순서 (자음/모음 단위)
  final List<String> typingSteps = [
    'ㅌ',
    'ㅌㅏ',
    '타',
    '타ㄷ',
    '타ㄷㅏ',
    '타다ㄷ',
    '타다ㄷㅏ',
    '타다닥',
  ];

  int _currentIndex = 0;
  Timer? _timer;

  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnim = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _startTyping();
  }

  void _startTyping() {
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (_currentIndex < typingSteps.length) {
        setState(() {
          _controller.forward(from: 0.0);
          _currentIndex++;
        });
      } else {
        timer.cancel(); // 애니메이션 종료
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = typingSteps[_currentIndex.clamp(0, typingSteps.length - 1)];

    if (_currentIndex == typingSteps.length) {
      // 마지막 인덱스일 땐 애니메이션 없이 정적 텍스트
      return Text(
        text,
        style: AppTextStyles.titleBold(
          color: ColorStyles.black,
        ).copyWith(letterSpacing: 10, fontSize: 60),
      );
    }

    // 애니메이션이 적용될 경우
    return ScaleTransition(
      scale: _scaleAnim,
      child: Text(
        text,
        style: AppTextStyles.titleBold(
          color: ColorStyles.black,
        ).copyWith(letterSpacing: 10, fontSize: 60),
      ),
    );
  }
}
