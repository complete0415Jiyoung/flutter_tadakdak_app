import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tadaktak_app/core/validation/validation_manager.dart';
import 'package:tadaktak_app/domain/use_case.dart/auth/sign_up_with_email_use_case.dart';
import 'package:tadaktak_app/presentation/providers/auth_state_notifier.dart';
import 'package:tadaktak_app/presentation/screen/sign_up/action/sign_up_action.dart';
import 'sign_up_state.dart';

class SignUpStateNotifier extends StateNotifier<SignUpState> {
  final SignUpWithEmailUseCase _signUpWithEmailUseCase;
  final AuthStateNotifier _authStateNotifier;
  final ValidationManager _validationManager = ValidationManager.instance;

  // 폼 필드 컨트롤러
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignUpStateNotifier(this._signUpWithEmailUseCase, this._authStateNotifier)
    : super(const SignUpState()) {
    // 컨트롤러에 리스너 추가
    nameController.addListener(_onNameChanged);
    emailController.addListener(_onEmailChanged);
    passwordController.addListener(_onPasswordChanged);
    confirmPasswordController.addListener(_onConfirmPasswordChanged);
  }

  // 컨트롤러 리스너
  void _onNameChanged() {
    handleAction(SignUpAction.nameChanged(nameController.text));
  }

  void _onEmailChanged() {
    handleAction(SignUpAction.emailChanged(emailController.text));
  }

  void _onPasswordChanged() {
    handleAction(SignUpAction.passwordChanged(passwordController.text));
  }

  void _onConfirmPasswordChanged() {
    handleAction(
      SignUpAction.confirmPasswordChanged(confirmPasswordController.text),
    );
  }

  Future<void> handleAction(SignUpAction action) async {
    switch (action) {
      case TogglePasswordVisibility():
        togglePasswordVisibility();

      case ToggleConfirmPasswordVisibility():
        toggleConfirmPasswordVisibility();

      case SignUp(
        email: final email,
        password: final password,
        name: final name,
      ):
        if (!validateForm()) return;
        await signUp(email, password, name);

      case EmailChanged(email: final email):
        validateEmail(email);

      case PasswordChanged(password: final password):
        validatePassword(password);
        // 비밀번호가 변경되면 비밀번호 확인도 다시 검증
        if (state.confirmPassword.isNotEmpty) {
          validateConfirmPassword(state.confirmPassword);
        }

      case ConfirmPasswordChanged(confirmPassword: final confirmPassword):
        validateConfirmPassword(confirmPassword);

      case NameChanged(name: final name):
        validateName(name);

      case ValidateForm():
        validateForm();
    }
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  void toggleConfirmPasswordVisibility() {
    state = state.copyWith(
      isConfirmPasswordVisible: !state.isConfirmPasswordVisible,
    );
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

  // 비밀번호 확인 유효성 검사 - ValidationManager 활용
  void validateConfirmPassword(String confirmPassword) {
    final error = _validationManager.validateConfirmPassword(
      confirmPassword,
      state.password,
    );

    state = state.copyWith(
      confirmPassword: confirmPassword,
      confirmPasswordError: error,
    );

    _updateFormValidStatus();
  }

  // 이름 유효성 검사 - ValidationManager 활용
  void validateName(String name) {
    final error = _validationManager.validateName(name);

    state = state.copyWith(name: name, nameError: error);

    _updateFormValidStatus();
  }

  // 폼 유효성 상태 업데이트
  void _updateFormValidStatus() {
    final isValid =
        state.emailError == null &&
        state.email.isNotEmpty &&
        state.passwordError == null &&
        state.password.isNotEmpty &&
        state.confirmPasswordError == null &&
        state.confirmPassword.isNotEmpty &&
        state.nameError == null &&
        state.name.isNotEmpty;

    state = state.copyWith(isFormValid: isValid);
  }

  // 전체 폼 유효성 검사
  bool validateForm() {
    validateEmail(state.email);
    validatePassword(state.password);
    validateConfirmPassword(state.confirmPassword);
    validateName(state.name);
    return state.isFormValid;
  }

  Future<void> signUp(String email, String password, String name) async {
    // 폼 유효성 검사를 이미 통과했다고 가정
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final user = await _signUpWithEmailUseCase.execute(
        email.trim(),
        password,
        name.trim(),
      );

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
    nameController.removeListener(_onNameChanged);
    emailController.removeListener(_onEmailChanged);
    passwordController.removeListener(_onPasswordChanged);
    confirmPasswordController.removeListener(_onConfirmPasswordChanged);

    // 컨트롤러 dispose
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
