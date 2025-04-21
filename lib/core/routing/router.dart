import 'package:go_router/go_router.dart';
import 'package:tadaktak_app/core/routing/routes.dart';
import 'package:tadaktak_app/presentation/screen/sign_in/sign_in_screen.dart';
import 'package:tadaktak_app/presentation/screen/splash/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    // SplashScreen
    GoRoute(path: Routes.splash, builder: (conttext, state) => SplashScreen()),
    // SignInScreen
    GoRoute(path: Routes.signIn, builder: (conttext, state) => SignInScreen()),
    // 장문 엽습하기
    // GoRoute(path: Routes.signUp, builder: (conttext, state) => SignUpScreen()),
  ],
);
