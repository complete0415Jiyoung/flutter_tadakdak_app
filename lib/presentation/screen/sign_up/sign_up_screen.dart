import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tadaktak_app/core/styles/app_text_styles.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';
import 'package:tadaktak_app/presentation/component/buttons.dart';
import 'package:tadaktak_app/presentation/component/input_field.dart';
import 'package:tadaktak_app/presentation/screen/sign_up/action/sign_up_action.dart';
import 'package:tadaktak_app/presentation/screen/sign_up/state/sign_up_state.dart';

class SignUpScreen extends StatelessWidget {
  // 기존 필수 파라미터
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  // MVI 패턴 파라미터 - 기본값을 통해 이전 코드와 호환성 유지
  final SignUpState? state;
  final Function(SignUpAction)? onAction;

  const SignUpScreen({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    this.state, // 선택적 파라미터로 변경
    this.onAction, // 선택적 파라미터로 변경
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;

    // state가 null이면 기본값 사용 (이전 코드와 호환)
    final isPasswordVisible = state?.isPasswordVisible ?? false;
    final isConfirmPasswordVisible = state?.isConfirmPasswordVisible ?? false;
    final isLoading = state?.isLoading ?? false;
    final errorMessage = state?.errorMessage;
    final isFormValid = state?.isFormValid ?? true; // 기본적으로 활성화

    // nameError, emailError 등 오류 메시지들
    final nameError = state?.nameError;
    final emailError = state?.emailError;
    final passwordError = state?.passwordError;
    final confirmPasswordError = state?.confirmPasswordError;

    // 액션 핸들러 또는 기존 콜백 함수
    void togglePasswordVisibility() {
      if (onAction != null) {
        onAction!(const SignUpAction.togglePasswordVisibility());
      }
      // onAction이 null이면 아무 동작도 하지 않음
    }

    void toggleConfirmPasswordVisibility() {
      if (onAction != null) {
        onAction!(const SignUpAction.toggleConfirmPasswordVisibility());
      }
    }

    void signup() {
      if (onAction != null) {
        onAction!(
          SignUpAction.signUp(
            email: emailController.text,
            password: passwordController.text,
            name: nameController.text,
          ),
        );
      } else {
        // 기존 동작: 폼 검증 등
        if (formKey.currentState?.validate() == true) {
          // 기존 로직 - 값을 전달하는 콜백 등이 있으면 여기서 처리
        }
      }
    }

    void onNameChanged(String value) {
      if (onAction != null) {
        onAction!(SignUpAction.nameChanged(value));
      }
    }

    void onEmailChanged(String value) {
      if (onAction != null) {
        onAction!(SignUpAction.emailChanged(value));
      }
    }

    void onPasswordChanged(String value) {
      if (onAction != null) {
        onAction!(SignUpAction.passwordChanged(value));
      }
    }

    void onConfirmPasswordChanged(String value) {
      if (onAction != null) {
        onAction!(SignUpAction.confirmPasswordChanged(value));
      }
    }

    return Scaffold(
      backgroundColor: ColorStyles.purple100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: ColorStyles.black),
          onPressed: () => context.pop(),
        ),
        title: Text(
          "회원가입",
          style: AppTextStyles.largeBold(color: ColorStyles.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.02),

                  // 이름 입력 필드
                  InputField(
                    label: '이름',
                    hintText: '이름을 입력하세요',
                    controller: nameController,
                    errorText: nameError,
                    onChanged: onNameChanged,
                    // validator 속성 제거 - 검증 로직은 모두 StateNotifier로 이동
                  ),

                  SizedBox(height: height * 0.025),

                  // 이메일 입력 필드
                  InputField(
                    label: '이메일',
                    hintText: '이메일을 입력하세요',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    errorText: emailError,
                    onChanged: onEmailChanged,
                    // validator 속성 제거 - 검증 로직은 모두 StateNotifier로 이동
                  ),

                  SizedBox(height: height * 0.025),

                  // 비밀번호 입력 필드
                  PasswordTextField(
                    label: '비밀번호',
                    hintText: '비밀번호를 입력하세요 (6자 이상)',
                    controller: passwordController,
                    isPasswordVisible: isPasswordVisible,
                    togglePasswordVisibility: togglePasswordVisibility,
                    errorText: passwordError,
                    onChanged: onPasswordChanged,
                    // validator 속성 제거 - 검증 로직은 모두 StateNotifier로 이동
                  ),

                  SizedBox(height: height * 0.025),

                  // 비밀번호 확인 입력 필드
                  PasswordTextField(
                    label: '비밀번호 확인',
                    hintText: '비밀번호를 다시 입력하세요',
                    controller: confirmPasswordController,
                    isPasswordVisible: isConfirmPasswordVisible,
                    togglePasswordVisibility: toggleConfirmPasswordVisibility,
                    textInputAction: TextInputAction.done,
                    errorText: confirmPasswordError,
                    onChanged: onConfirmPasswordChanged,
                    // validator 속성 제거 - 검증 로직은 모두 StateNotifier로 이동
                  ),

                  SizedBox(height: height * 0.03),

                  // 에러 메시지 표시
                  if (errorMessage != null)
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: ColorStyles.red100,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              errorMessage,
                              style: AppTextStyles.smallBold(
                                color: ColorStyles.red100,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  SizedBox(height: height * 0.05),

                  // 회원가입 버튼
                  Buttons(
                    text: '회원가입',
                    btnColor: ColorStyles.purple900,
                    isLoading: isLoading,
                    onPressed: isFormValid ? signup : null,
                    size: ButtonSize.big,
                  ),

                  SizedBox(height: height * 0.02),

                  // 로그인 링크
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "이미 계정이 있으신가요?",
                            style: AppTextStyles.normalRegular(
                              color: ColorStyles.gray900,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "로그인",
                            style: AppTextStyles.normalBold(
                              color: ColorStyles.purple900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.04),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
