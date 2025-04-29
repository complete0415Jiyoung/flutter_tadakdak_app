import 'package:flutter/material.dart';
import 'package:tadaktak_app/core/styles/app_text_styles.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';

class SentenceInputBox extends StatelessWidget {
  final String question;
  final FocusNode focusNode;
  final TextEditingController controller;
  // 등 필요에 따라 인자 추가(예: onChanged 등)

  const SentenceInputBox({
    required this.question,
    required this.focusNode,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: ColorStyles.purple100,
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          child: Text(
            question,
            style: AppTextStyles.mediumRegular().copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        TextField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: TextInputType.text,
          style: AppTextStyles.mediumRegular(
            color: ColorStyles.black,
          ).copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            filled: false,
            hintText: '',
          ),
        ),
      ],
    );
  }
}
