import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';

abstract class AppTextStyles {
  // ─── Bold ─────────────────────────────
  static TextStyle titleBold({Color? color}) => GoogleFonts.blackHanSans(
    fontWeight: FontWeight.normal,
    fontSize: 50,
    height: 71 / 50,
    color: color ?? ColorStyles.gray900,
  );

  static TextStyle headerBold({Color? color}) => GoogleFonts.blackHanSans(
    fontWeight: FontWeight.normal,
    fontSize: 30,
    height: 45 / 30,
    color: color ?? ColorStyles.gray900,
  );

  static TextStyle largeBold({Color? color}) => GoogleFonts.blackHanSans(
    fontWeight: FontWeight.normal,
    fontSize: 20,
    height: 30 / 20,
    color: color ?? ColorStyles.gray900,
  );

  static TextStyle mediumBold({Color? color}) => GoogleFonts.blackHanSans(
    fontWeight: FontWeight.normal,
    fontSize: 18,
    height: 27 / 18,
    color: color ?? ColorStyles.gray900,
  );

  static TextStyle normalBold({Color? color}) => GoogleFonts.blackHanSans(
    fontWeight: FontWeight.normal,
    fontSize: 16,
    height: 24 / 16,
    color: color ?? ColorStyles.gray900,
  );

  static TextStyle smallBold({Color? color}) => GoogleFonts.blackHanSans(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    height: 21 / 14,
    color: color ?? ColorStyles.gray900,
  );

  static TextStyle extraSmallBold({Color? color}) => GoogleFonts.blackHanSans(
    fontWeight: FontWeight.normal,
    fontSize: 11,
    height: 17 / 11,
    color: color ?? ColorStyles.gray900,
  );

  // ─── Regular ─────────────────────────
  static TextStyle titleRegular({Color? color}) => GoogleFonts.notoSans(
    fontWeight: FontWeight.w400,
    fontSize: 50,
    height: 75 / 50,
    color: color ?? ColorStyles.gray900,
  );

  static TextStyle headerRegular({Color? color}) => GoogleFonts.notoSans(
    fontWeight: FontWeight.w400,
    fontSize: 30,
    height: 45 / 30,
    color: color ?? ColorStyles.gray900,
  );

  static TextStyle largeRegular({Color? color}) => GoogleFonts.notoSans(
    fontWeight: FontWeight.w400,
    fontSize: 20,
    height: 30 / 20,
    color: color ?? ColorStyles.gray900,
  );

  static TextStyle mediumRegular({Color? color}) => GoogleFonts.notoSans(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    height: 27 / 18,
    color: color ?? ColorStyles.gray900,
  );

  static TextStyle normalRegular({Color? color}) => GoogleFonts.notoSans(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 24 / 16,
    color: color ?? ColorStyles.gray900,
  );

  static TextStyle smallRegular({Color? color}) => GoogleFonts.notoSans(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 21 / 14,
    color: color ?? ColorStyles.gray900,
  );

  static TextStyle extraSmallRegular({Color? color}) => GoogleFonts.notoSans(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    height: 27 / 11,
    color: color ?? ColorStyles.gray900,
  );
}
