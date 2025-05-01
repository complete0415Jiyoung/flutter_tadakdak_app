import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tadaktak_app/core/routing/routes.dart'; // Routes 클래스 임포트
import 'package:tadaktak_app/presentation/screen/home/home_screen_root.dart';
import 'package:tadaktak_app/presentation/screen/sign_up/sign_up_screen_root.dart';
import '../../presentation/providers/auth_providers.dart';
import '../../presentation/screen/sign_in/sign_in_screen_root.dart';

import '../../presentation/screen/splash/splash_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: Routes.splash,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      if (authState.isLoading) return null;

      final isLoggedIn = authState.user != null;

      final isSplashScreen = state.uri.toString() == Routes.splash;
      final isSignInScreen = state.uri.toString() == Routes.signIn;
      final isSignUpScreen = state.uri.toString() == Routes.signUp;
      final isAuthRoute = isSignInScreen || isSignUpScreen;

      if (isSplashScreen) {
        return isLoggedIn ? Routes.home : Routes.signIn;
      }

      // 로그인된 사용자가 로그인/회원가입 화면으로 가려고 하면 홈으로 리디렉션
      if (isLoggedIn && isAuthRoute) {
        return Routes.home;
      }

      // 로그인되지 않은 사용자가 인증이 필요한 화면으로 가려고 하면 로그인으로 리디렉션
      if (!isLoggedIn && !isAuthRoute && !isSplashScreen) {
        return Routes.signIn;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.signIn,
        builder: (context, state) => const SignInScreenRoot(),
      ),
      GoRoute(
        path: Routes.signUp,
        builder: (context, state) => const SignUpScreenRoot(),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeScreenRoot(),
      ),
    ],
  );
});
