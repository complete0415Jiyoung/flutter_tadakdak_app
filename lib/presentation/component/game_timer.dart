import 'package:flutter/material.dart';
import 'package:tadaktak_app/core/styles/app_text_styles.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';

class GameTimer extends StatelessWidget {
  final String time;
  final String wpm;
  final String percent;

  const GameTimer({
    required this.time,
    required this.wpm,
    required this.percent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(time, style: AppTextStyles.largeBold(color: ColorStyles.white)),
          Text(
            wpm,
            style: AppTextStyles.headerBold(color: ColorStyles.purple100),
          ),
          Text(
            percent,
            style: AppTextStyles.largeBold(color: ColorStyles.white),
          ),
        ],
      ),
    );
  }
}
