import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tadaktak_app/core/routing/routes.dart';
import 'package:tadaktak_app/presentation/providers/auth_providers.dart';
import 'package:tadaktak_app/presentation/screen/sign_in/action/sign_in_action.dart';
import 'sign_in_screen.dart';

class SignInScreenRoot extends ConsumerWidget {
  const SignInScreenRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 로그인 화면 상태 관리 Provider
    final signInState = ref.watch(signInStateProvider);
    final signInNotifier = ref.watch(signInStateProvider.notifier);

    // 인증 상태 감시 (로그인 성공 시 화면 전환)
    ref.listen(authStateProvider, (previous, current) {
      if (current.user != null && previous?.user == null) {
        context.go(Routes.home);
      }
    });
    void handleAction(SignInAction action) {
      signInNotifier.handleAction(action);
    }

    return SignInScreen(
      state: signInState,
      onAction: handleAction,
      formKey: signInNotifier.formKey,
      emailController: signInNotifier.emailController,
      passwordController: signInNotifier.passwordController,
    );
  }
}
