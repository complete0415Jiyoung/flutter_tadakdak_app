import 'package:flutter/material.dart';
import 'package:tadaktak_app/core/styles/app_text_styles.dart';

class TextStylePreviewScreen extends StatelessWidget {
  const TextStylePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextStyle 모음', style: AppTextStyles.largeBold()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📌 Bold Styles', style: AppTextStyles.largeBold()),
            const SizedBox(height: 8),
            Text('titleBold', style: AppTextStyles.titleBold()),
            Text('headerBold', style: AppTextStyles.headerBold()),
            Text('largeBold', style: AppTextStyles.largeBold()),
            Text('mediumBold', style: AppTextStyles.mediumBold()),
            Text('normalBold', style: AppTextStyles.normalBold()),
            Text('smallBold', style: AppTextStyles.smallBold()),
            Text('extraSmallBold', style: AppTextStyles.extraSmallBold()),
            const SizedBox(height: 24),
            Text('📌 Regular Styles', style: AppTextStyles.largeBold()),
            const SizedBox(height: 8),
            Text('titleRegular', style: AppTextStyles.titleRegular()),
            Text('headerRegular', style: AppTextStyles.headerRegular()),
            Text('largeRegular', style: AppTextStyles.largeRegular()),
            Text('mediumRegular', style: AppTextStyles.mediumRegular()),
            Text('normalRegular', style: AppTextStyles.normalRegular()),
            Text('smallRegular', style: AppTextStyles.smallRegular()),
            Text('extraSmallRegular', style: AppTextStyles.extraSmallRegular()),
          ],
        ),
      ),
    );
  }
}
