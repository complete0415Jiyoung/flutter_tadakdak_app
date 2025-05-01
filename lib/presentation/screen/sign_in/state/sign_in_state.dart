// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  final bool isLoading;
  final bool isPasswordVisible;
  final String email;
  final String password;
  final bool isFormValid;
  final String? errorMessage;
  final String? emailError;
  final String? passwordError;

  const SignInState({
    this.isLoading = false,
    this.isPasswordVisible = false,
    this.email = '',
    this.password = '',
    this.isFormValid = false,
    this.errorMessage,
    this.emailError,
    this.passwordError,
  });
}
