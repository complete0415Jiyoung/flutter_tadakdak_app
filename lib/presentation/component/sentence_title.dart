import 'package:flutter/material.dart';
import 'package:tadaktak_app/core/styles/app_text_styles.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';

class SentenceTitle extends StatelessWidget {
  final String typeLabel, titleText;

  const SentenceTitle({
    required this.typeLabel,
    required this.titleText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: ColorStyles.gray400,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Text(
              typeLabel,
              style: AppTextStyles.smallBold(color: ColorStyles.bcWhite),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            titleText,
            style: AppTextStyles.largeBold(color: ColorStyles.white),
          ),
        ],
      ),
    );
  }
}
