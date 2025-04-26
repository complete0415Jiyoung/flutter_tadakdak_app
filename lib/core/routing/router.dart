import 'package:go_router/go_router.dart';
import 'package:tadaktak_app/core/routing/routes.dart';
import 'package:tadaktak_app/presentation/screen/home/home_view_model.dart';
import 'package:tadaktak_app/presentation/screen/home/screen/home_screen_root.dart';
import 'package:tadaktak_app/presentation/screen/long_sentence/long_sentence_view_model.dart';
import 'package:tadaktak_app/presentation/screen/long_sentence/screen/long_sentence_screen_root.dart';
import 'package:tadaktak_app/presentation/screen/sign_in/sign_in_screen.dart';
import 'package:tadaktak_app/presentation/screen/splash/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    // SplashScreen
    GoRoute(path: Routes.splash, builder: (conttext, state) => SplashScreen()),
    // SignInScreen
    GoRoute(path: Routes.signIn, builder: (conttext, state) => SignInScreen()),
    // 홈화면
    GoRoute(
      path: Routes.home,
      builder: (conttext, state) => HomeScreenRoot(viewModel: HomeViewModel()),
    ),
    // GoRoute(path: Routes.signUp, builder: (conttext, state) => SignUpScreen()),
    GoRoute(
      path: Routes.longSentence,
      builder:
          (conttext, state) =>
              LongSentenceScreenRoot(viewModel: LongSentenceViewModel()),
    ),
    // 홈화면
  ],
);
