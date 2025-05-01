import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_action.freezed.dart';

@freezed
sealed class SignInAction with _$SignInAction {
  // 비밀번호 표시/숨김 토글
  const factory SignInAction.togglePasswordVisibility() =
      TogglePasswordVisibility;

  // 이메일 로그인 - 필드 직접 포함
  const factory SignInAction.signInWithEmail({
    required String email,
    required String password,
  }) = SignInWithEmail;

  // 익명 로그인
  const factory SignInAction.signInAnonymously() = SignInAnonymously;

  // 이메일 필드 변경
  const factory SignInAction.emailChanged(String email) = EmailChanged;

  // 비밀번호 필드 변경
  const factory SignInAction.passwordChanged(String password) = PasswordChanged;

  // 폼 유효성 검사
  const factory SignInAction.validateForm() = ValidateForm;
}
