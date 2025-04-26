import 'package:flutter/material.dart';
import 'package:tadaktak_app/core/styles/app_text_styles.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';
import 'package:tadaktak_app/presentation/component/home_card.dart';
import 'package:tadaktak_app/presentation/component/practice_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상단 설정 아이콘
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.black, size: 28),
                    onPressed: () {
                      print('설정입니다.');
                    },
                  ),
                ],
              ),
              // 닉네임, 인사 & 프로필
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "안녕하세요",
                          style: AppTextStyles.headerBold(
                            color: ColorStyles.black,
                          ),
                          children: [
                            WidgetSpan(
                              child: Text(
                                "👋",
                                style: AppTextStyles.headerBold(
                                  color: ColorStyles.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "타자연습을 시작해 보세요.",
                        style: AppTextStyles.largeBold(
                          color: ColorStyles.black,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(
                      'assets/images/default_profile.png',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28),
              // 로그인했을 때
              HomeCard(count: 20, isLogin: true, accuracy: 99.9, hitter: 235),
              SizedBox(height: 30),
              // 비로그인
              // HomeCard(count: 20, isLogin: false, accuracy: 99.9, hitter: 235),
              // SizedBox(height: 26),
              // 연습모드 카드 박스
              Expanded(
                child: Column(
                  children: [
                    PracticeButton(
                      text: '장문 연습하기',
                      icon: Icons.keyboard,
                      iconSize: 24,
                      onClick: () {
                        print('클릭함료~');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
