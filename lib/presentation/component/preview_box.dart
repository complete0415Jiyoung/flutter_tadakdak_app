import 'package:flutter/material.dart';
import 'package:tadaktak_app/core/styles/app_text_styles.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';

class PreviewBox extends StatelessWidget {
  final List<String> previewLines;

  const PreviewBox({required this.previewLines, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          previewLines
              .map(
                (line) => Text(
                  line,
                  style: AppTextStyles.mediumRegular(
                    color: ColorStyles.gray300,
                  ),
                ),
              )
              .toList(),
    );
  }
}
