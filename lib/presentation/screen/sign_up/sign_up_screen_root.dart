// lib/presentation/screen/sign_up/sign_up_screen_root.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tadaktak_app/core/routing/routes.dart';
import 'package:tadaktak_app/presentation/screen/sign_up/action/sign_up_action.dart';
import '../../providers/auth_providers.dart';
import 'sign_up_screen.dart';

class SignUpScreenRoot extends ConsumerWidget {
  const SignUpScreenRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 상태 및 Notifier 얻기
    final signUpState = ref.watch(signUpStateProvider);
    final signUpNotifier = ref.watch(signUpStateProvider.notifier);

    // 인증 상태 감시 (회원가입 성공 시 화면 전환)
    ref.listen(authStateProvider, (previous, current) {
      if (current.user != null && previous?.user == null) {
        // 회원가입 성공 시 홈 화면으로 이동
        context.go(Routes.home);
      }
    });

    // Action 핸들러 함수
    void handleAction(SignUpAction action) {
      signUpNotifier.handleAction(action);
    }

    return SignUpScreen(
      state: signUpState,
      onAction: handleAction,
      formKey: signUpNotifier.formKey,
      nameController: signUpNotifier.nameController,
      emailController: signUpNotifier.emailController,
      passwordController: signUpNotifier.passwordController,
      confirmPasswordController: signUpNotifier.confirmPasswordController,
    );
  }
}
