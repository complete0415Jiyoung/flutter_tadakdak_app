import 'package:flutter/material.dart';
import 'package:tadaktak_app/core/styles/app_text_styles.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';
import 'package:tadaktak_app/presentation/preview_screen/buttons_preview_screen.dart';
import 'package:tadaktak_app/presentation/preview_screen/color_style_preview_screen.dart';
import 'package:tadaktak_app/presentation/preview_screen/text_style_preview_screen.dart';

class PreviewMain extends StatelessWidget {
  const PreviewMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      appBar: AppBar(
        surfaceTintColor: ColorStyles.white,
        backgroundColor: ColorStyles.white,
        title: Text('UI 미리보기', style: AppTextStyles.mediumBold()),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                '📍AppTextStyle 모음',
                style: AppTextStyles.mediumBold(),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TextStylePreviewScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                '📍AppColorStyles 모음',
                style: AppTextStyles.mediumBold(),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ColorStylesPreviewScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('📍Buttons 모음', style: AppTextStyles.mediumBold()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ButtonsPreviewScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
