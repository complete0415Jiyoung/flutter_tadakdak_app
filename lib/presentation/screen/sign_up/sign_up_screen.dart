import 'package:flutter/material.dart';
import 'package:tadaktak_app/core/styles/app_text_styles.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';
import 'package:tadaktak_app/presentation/component/buttons.dart';
import 'package:tadaktak_app/presentation/preview_screen/preview_main_screen.dart';
import 'package:tadaktak_app/presentation/component/logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: AppTextStyles.titleBold(
                    color: ColorStyles.white20,
                  ).copyWith(fontSize: width * 0.195),
                ),
                Text(
                  "TADAKDAK",
                  style: AppTextStyles.titleBold(
                    color: ColorStyles.white20,
                  ).copyWith(fontSize: width * 0.175),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: AppTextStyles.titleBold(
                    color: ColorStyles.white20,
                  ).copyWith(fontSize: width * 0.195),
                ),
                Text(
                  "TADAKDAK",
                  style: AppTextStyles.titleBold(
                    color: ColorStyles.white20,
                  ).copyWith(fontSize: width * 0.175),
                ),
              ],
            ),
          ),
          // 중앙 텍스트와 버튼
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "모바일 타자연습",
                        style: AppTextStyles.headerBold(
                          color: ColorStyles.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Logo(),
                      SizedBox(height: size.height * 0.08),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            Buttons(
                              text: '카카오톡 로그인',
                              btnColor: ColorStyles.yellow100,
                              textColor: ColorStyles.gray900,
                              onPressed: () {
                                print('카카오 로그인 진행');
                              },
                            ),
                            const SizedBox(height: 12),
                            Buttons(
                              text: '시작하기',
                              btnColor: ColorStyles.purple900,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PreviewMain(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
