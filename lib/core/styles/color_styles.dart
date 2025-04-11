import 'package:flutter/material.dart';

abstract class ColorStyles {
  // ⚫ Black & White
  static const black = Color(0xFF000000);
  static const black100 = Color(0xFF000000);
  static const bcWhite = Color(0xFFFFFFFF);
  static const white = Color(0xFFFFFFFF);
  static const white20 = Color(0x33FFFFFF); // 20% 투명도의 흰색

  // ⚪ Gray Scale
  static const gray4 = Color(0xFFD9D9D9);
  static const gray50 = Color(0xFFF7F7F9);
  static const gray300 = Color(0xFF9D9D9D); // borderLight로 사용됨
  static const gray400 = Color(0xFF9A9B9E);
  static const gray800 = Color(0xFF333333); // elementsGray로 사용됨
  static const gray900 = Color(0xFF1F1F1F); // textBlack로 사용됨

  // 🔵 Blue
  static const blue100 = Color(0xFF2F80ED);

  // 🟣 Purple
  static const purple100 = Color(0xFF8472FF);
  static const purple200 = Color(0xFFC9C5E2);
  static const purple300 = Color(0xFF9747FF);
  static const purple500 = Color(0xFF9B51E0);
  static const purple900 = Color(0xFF322F49);

  // 🔴 Red & Pink
  static const red100 = Color(0xFFF62424);
  static const pink100 = Color(0xFFF8B3B8);

  // 🟡 Yellow
  static const yellow100 = Color(0xFFFEE500);

  // ✅ Semantic alias (편의를 위한 의미 기반 네이밍)
  static const borderLight = gray300;
  static const elementsGray = gray800;
  static const textBlack = gray900;
}
