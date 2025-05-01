import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tadaktak_app/core/styles/app_text_styles.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';
import 'package:tadaktak_app/presentation/component/logo.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: ColorStyles.purple100, // 보라색 배경
      body: SafeArea(
        child: Stack(
          children: [
            // 배경 텍스트들
            Positioned(
              top: height * 0.05,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "TADADAK",
                  style: AppTextStyles.titleBold(
                    color: ColorStyles.white20,
                  ).copyWith(fontSize: width * 0.13),
                ),
              ),
            ),
            Positioned(
              bottom: height * 0.05,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "Welcome",
                  style: AppTextStyles.titleBold(
                    color: ColorStyles.white20,
                  ).copyWith(fontSize: width * 0.13),
                ),
              ),
            ),

            // 중앙 콘텐츠
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "모바일 타자연습",
                    style: AppTextStyles.headerBold(color: ColorStyles.white),
                  ),
                  SizedBox(height: height * 0.03),
                  const Logo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
