import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tadaktak_app/core/validation/validation_manager.dart';
import 'package:tadaktak_app/domain/use_case.dart/auth/sign_in_anonmously_use_case.dart';
import 'package:tadaktak_app/domain/use_case.dart/auth/sign_in_with_email_use_case.dart';
import 'package:tadaktak_app/presentation/providers/auth_state_notifier.dart';
import 'package:tadaktak_app/presentation/screen/sign_in/action/sign_in_action.dart';
import 'sign_in_state.dart';

class SignInStateNotifier extends StateNotifier<SignInState> {
  final SignInWithEmailUseCase _signInWithEmailUseCase;
  final SignInAnonymouslyUseCase _signInAnonymouslyUseCase;
  final AuthStateNotifier _authStateNotifier;
  final ValidationManager _validationManager = ValidationManager.instance;

  // 폼 필드 컨트롤러 - 컨트롤러는 여전히 유지 (UI 표시용)
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignInStateNotifier(
    this._signInWithEmailUseCase,
    this._signInAnonymouslyUseCase,
    this._authStateNotifier,
  ) : super(const SignInState()) {
    // 컨트롤러에 리스너 추가
    emailController.addListener(_onEmailChanged);
    passwordController.addListener(_onPasswordChanged);
  }

  // 컨트롤러 리스너
  void _onEmailChanged() {
    handleAction(SignInAction.emailChanged(emailController.text));
  }

  void _onPasswordChanged() {
    handleAction(SignInAction.passwordChanged(passwordController.text));
  }

  Future<void> handleAction(SignInAction action) async {
    switch (action) {
      case TogglePasswordVisibility():
        togglePasswordVisibility();

      case SignInWithEmail(email: final email, password: final password):
        if (!validateForm()) return;
        await signInWithEmail();

      case SignInAnonymously():
        await signInAnonymously();

      case EmailChanged(email: final email):
        validateEmail(email);

      case PasswordChanged(password: final password):
        validatePassword(password);

      case ValidateForm():
        validateForm();
    }
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  // 이메일 유효성 검사 - ValidationManager 활용
  void validateEmail(String email) {
    final error = _validationManager.validateEmail(email);

    state = state.copyWith(email: email, emailError: error);

    _updateFormValidStatus();
  }

  // 비밀번호 유효성 검사 - ValidationManager 활용
  void validatePassword(String password) {
    final error = _validationManager.validatePassword(password);

    state = state.copyWith(password: password, passwordError: error);

    _updateFormValidStatus();
  }

  // 폼 유효성 상태 업데이트
  void _updateFormValidStatus() {
    final isValid =
        state.emailError == null &&
        state.email.isNotEmpty &&
        state.passwordError == null &&
        state.password.isNotEmpty;

    state = state.copyWith(isFormValid: isValid);
  }

  // 전체 폼 유효성 검사
  bool validateForm() {
    validateEmail(state.email);
    validatePassword(state.password);
    return state.isFormValid;
  }

  Future<void> signInWithEmail() async {
    // 폼 유효성 검사를 이미 통과했다고 가정
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final user = await _signInWithEmailUseCase.execute(
        state.email.trim(),
        state.password,
      );

      // 인증 상태 업데이트 (전역)
      _authStateNotifier.updateAuthState(user);

      // 로컬 상태 업데이트
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> signInAnonymously() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final user = await _signInAnonymouslyUseCase.execute();

      // 인증 상태 업데이트 (전역)
      _authStateNotifier.updateAuthState(user);

      // 로컬 상태 업데이트
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  @override
  void dispose() {
    // 컨트롤러 리스너 제거
    emailController.removeListener(_onEmailChanged);
    passwordController.removeListener(_onPasswordChanged);

    // 컨트롤러 dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
