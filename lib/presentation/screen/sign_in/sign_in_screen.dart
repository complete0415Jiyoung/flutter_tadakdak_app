import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tadaktak_app/core/routing/routes.dart';
import 'package:tadaktak_app/core/styles/app_text_styles.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';
import 'package:tadaktak_app/presentation/component/buttons.dart';
import 'package:tadaktak_app/presentation/component/input_field.dart';
import 'package:tadaktak_app/presentation/component/logo.dart';
import 'package:tadaktak_app/presentation/screen/sign_in/action/sign_in_action.dart';
import 'package:tadaktak_app/presentation/screen/sign_in/state/sign_in_state.dart';

class SignInScreen extends StatelessWidget {
  final SignInState state;
  final Function(SignInAction) onAction;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInScreen({
    super.key,
    required this.state,
    required this.onAction,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;

    return Scaffold(
      backgroundColor: ColorStyles.purple100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 로고 및 타이틀
                  SizedBox(height: height * 0.08),
                  Center(
                    child: Column(
                      children: [
                        const Logo(),
                        Text(
                          "타자 연습의 시작",
                          style: AppTextStyles.largeBold(
                            color: ColorStyles.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.06),

                  // 에러 메시지 표시
                  if (state.errorMessage != null)
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
                              state.errorMessage!,
                              style: AppTextStyles.smallBold(
                                color: ColorStyles.red100,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  // 이메일 입력 필드
                  InputField(
                    label: '이메일',
                    hintText: '이메일을 입력하세요',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    errorText: state.emailError,
                    onChanged:
                        (value) => onAction(SignInAction.emailChanged(value)),
                  ),

                  SizedBox(height: height * 0.025),

                  // 비밀번호 입력 필드
                  PasswordTextField(
                    label: '비밀번호',
                    hintText: '비밀번호를 입력하세요',
                    controller: passwordController,
                    isPasswordVisible: state.isPasswordVisible,
                    errorText: state.passwordError,
                    togglePasswordVisibility:
                        () => onAction(
                          const SignInAction.togglePasswordVisibility(),
                        ),
                    onChanged:
                        (value) =>
                            onAction(SignInAction.passwordChanged(value)),
                  ),

                  const SizedBox(height: 8),

                  // 회원가입 링크
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        context.push(Routes.signUp);
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "계정이 없으신가요?",
                            style: AppTextStyles.normalRegular(
                              color: ColorStyles.gray900,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "회원가입",
                            style: AppTextStyles.normalBold(
                              color: ColorStyles.purple900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.1),

                  // 로그인 버튼
                  Buttons(
                    text: '로그인',
                    btnColor: ColorStyles.purple900,
                    size: ButtonSize.big,
                    isLoading: state.isLoading,
                    onPressed:
                        state.isFormValid
                            ? () => onAction(
                              SignInAction.signInWithEmail(
                                email: state.email,
                                password: state.password,
                              ),
                            )
                            : null, // 폼이 유효하지 않으면 버튼 비활성화
                  ),

                  const SizedBox(height: 16),

                  // 비회원 로그인 버튼
                  Buttons(
                    text: '비회원으로 시작하기',
                    btnColor: ColorStyles.white,
                    textColor: ColorStyles.purple900,
                    isLoading: state.isLoading,
                    size: ButtonSize.big,
                    onPressed:
                        state.isLoading
                            ? null
                            : () => onAction(
                              const SignInAction.signInAnonymously(),
                            ),
                  ),

                  SizedBox(height: height * 0.06),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
