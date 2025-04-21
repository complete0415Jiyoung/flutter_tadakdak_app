import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tadaktak_app/core/routing/router.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: ColorStyles.white,
      ),
      routerConfig: router,
    );
  }
}
