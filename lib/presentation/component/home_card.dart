import 'package:flutter/material.dart';
import 'package:tadaktak_app/core/styles/app_text_styles.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';

class HomeCard extends StatelessWidget {
  final bool isLogin;
  final int count;
  final double accuracy;
  final int hitter;

  const HomeCard({
    super.key,
    required this.isLogin,
    this.count = 0,
    this.accuracy = 0.0,
    this.hitter = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorStyles.purple100,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          isLogin
              ? Text(
                "총 연습횟수 $count번",
                style: AppTextStyles.mediumBold(color: ColorStyles.white),
              )
              : Text(
                "로그인 후 기록을 확인해 보세요~",
                style: AppTextStyles.mediumBold(color: ColorStyles.white),
              ),

          const SizedBox(height: 6),
          Divider(height: 1),
          const SizedBox(height: 10),
          Row(
            children: [
              // 평균 정확도 영역 (왼쪽)
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.speed, color: Colors.white, size: 18),
                        SizedBox(width: 6),
                        Text(
                          "평균정확도",
                          style: AppTextStyles.normalRegular(
                            color: ColorStyles.white,
                          ).copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),

                    isLogin
                        ? Text(
                          "$accuracy %",
                          style: AppTextStyles.normalRegular(
                            color: ColorStyles.white,
                          ),
                        )
                        : Text(
                          "--- %",
                          style: AppTextStyles.normalRegular(
                            color: ColorStyles.white,
                          ),
                        ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.keyboard, color: Colors.white, size: 18),
                        SizedBox(width: 6),
                        Text(
                          "평균타수",
                          style: AppTextStyles.normalRegular(
                            color: ColorStyles.white,
                          ).copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    isLogin
                        ? Text(
                          "$hitter",
                          style: AppTextStyles.normalRegular(
                            color: ColorStyles.white,
                          ),
                        )
                        : Text(
                          "--- %",
                          style: AppTextStyles.normalRegular(
                            color: ColorStyles.white,
                          ),
                        ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
