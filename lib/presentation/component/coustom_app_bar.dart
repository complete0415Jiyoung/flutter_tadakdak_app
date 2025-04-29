import 'package:flutter/material.dart';
import 'package:tadaktak_app/core/styles/app_text_styles.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onClose;

  const CustomAppBar({required this.title, this.onClose, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.headerBold(color: ColorStyles.white),
          ),
          GestureDetector(
            onTap: onClose, // callback
            child: Icon(Icons.close, color: ColorStyles.white),
          ),
        ],
      ),
    );
  }
}
