// lib/presentation/screen/sign_up/action/sign_up_action.dart

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_action.freezed.dart';

@freezed
sealed class SignUpAction with _$SignUpAction {
  // 비밀번호 표시/숨김 토글
  const factory SignUpAction.togglePasswordVisibility() =
      TogglePasswordVisibility;

  // 비밀번호 확인 표시/숨김 토글
  const factory SignUpAction.toggleConfirmPasswordVisibility() =
      ToggleConfirmPasswordVisibility;

  // 회원가입 실행
  const factory SignUpAction.signUp({
    required String email,
    required String password,
    required String name,
  }) = SignUp;

  // 이메일 필드 변경
  const factory SignUpAction.emailChanged(String email) = EmailChanged;

  // 비밀번호 필드 변경
  const factory SignUpAction.passwordChanged(String password) = PasswordChanged;

  // 비밀번호 확인 필드 변경
  const factory SignUpAction.confirmPasswordChanged(String confirmPassword) =
      ConfirmPasswordChanged;

  // 이름 필드 변경
  const factory SignUpAction.nameChanged(String name) = NameChanged;

  // 모든 필드 유효성 검사
  const factory SignUpAction.validateForm() = ValidateForm;
}
