import 'package:flutter/material.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';

class ProgressBar extends StatelessWidget {
  final double progress; // 0.0 ~ 1.0

  const ProgressBar({required this.progress, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 10,
      decoration: BoxDecoration(color: ColorStyles.gray4),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress,
        child: Container(decoration: BoxDecoration(color: Color(0xFF7E6BFF))),
      ),
    );
  }
}
