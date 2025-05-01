// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  final bool isLoading;
  final String? errorMessage;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final String email;
  final String password;
  final String confirmPassword;
  final String name;
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;
  final String? nameError;

  final bool isFormValid;

  const SignUpState({
    this.isLoading = false,
    this.errorMessage,
    this.isPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.name = '',
    this.isFormValid = false,
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
    this.nameError,
  });
}
