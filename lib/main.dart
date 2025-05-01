import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart'; // <-- 추가!
import 'package:tadaktak_app/core/routing/router.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // SystemChrome 사용 이전에 초기화
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // 세로 모드로 제한
  ]);
  runApp(ProviderScope(child: MyApp()));
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
