import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tadaktak_app/data/data_source/auth_data_source_impl.dart';
import 'package:tadaktak_app/domain/use_case.dart/auth/get_current_user_use_case.dart';
import 'package:tadaktak_app/domain/use_case.dart/auth/sign_in_anonmously_use_case.dart';
import 'package:tadaktak_app/domain/use_case.dart/auth/sign_in_with_email_use_case.dart';
import 'package:tadaktak_app/domain/use_case.dart/auth/sign_out_use_case.dart';
import 'package:tadaktak_app/domain/use_case.dart/auth/sign_up_with_email_use_case.dart';
import 'package:tadaktak_app/presentation/providers/auth_state_notifier.dart';
import 'package:tadaktak_app/presentation/screen/sign_in/state/sign_in_state.dart';
import 'package:tadaktak_app/presentation/screen/sign_in/state/sign_in_state_notififer.dart';
import 'package:tadaktak_app/presentation/screen/sign_up/state/sign_up_state.dart';
import 'package:tadaktak_app/presentation/screen/sign_up/state/sign_up_state_notification.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/data_source/auth_data_source.dart';
import '../../domain/repositories/auth_repository.dart';
import '../state/auth_state.dart';

final firebaseAuthProvider = Provider<firebase_auth.FirebaseAuth>((ref) {
  return firebase_auth.FirebaseAuth.instance;
});

final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSourceImpl(ref.watch(firebaseAuthProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.watch(authDataSourceProvider));
});

// UseCase 프로바이더들
final getCurrentUserUseCaseProvider = Provider<GetCurrentUserUseCase>((ref) {
  return GetCurrentUserUseCase(ref.watch(authRepositoryProvider));
});

final signInWithEmailUseCaseProvider = Provider<SignInWithEmailUseCase>((ref) {
  return SignInWithEmailUseCase(ref.watch(authRepositoryProvider));
});

final signUpWithEmailUseCaseProvider = Provider<SignUpWithEmailUseCase>((ref) {
  return SignUpWithEmailUseCase(ref.watch(authRepositoryProvider));
});

final signInAnonymouslyUseCaseProvider = Provider<SignInAnonymouslyUseCase>((
  ref,
) {
  return SignInAnonymouslyUseCase(ref.watch(authRepositoryProvider));
});

final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) {
  return SignOutUseCase(ref.watch(authRepositoryProvider));
});

// 기본 인증 상태관리 (현재 사용자 및 로그아웃)
final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((
  ref,
) {
  return AuthStateNotifier(
    ref.watch(getCurrentUserUseCaseProvider),
    ref.watch(signOutUseCaseProvider),
  );
});

final signInStateProvider =
    StateNotifierProvider.autoDispose<SignInStateNotifier, SignInState>((ref) {
      return SignInStateNotifier(
        ref.watch(signInWithEmailUseCaseProvider),
        ref.watch(signInAnonymouslyUseCaseProvider),
        ref.watch(authStateProvider.notifier),
      );
    });

final signUpStateProvider =
    StateNotifierProvider.autoDispose<SignUpStateNotifier, SignUpState>((ref) {
      return SignUpStateNotifier(
        ref.watch(signUpWithEmailUseCaseProvider),
        ref.watch(authStateProvider.notifier),
      );
    });
