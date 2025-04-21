import 'package:flutter/material.dart';
import 'package:tadaktak_app/core/styles/app_text_styles.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';
import 'package:tadaktak_app/presentation/component/buttons.dart';
import 'package:tadaktak_app/presentation/component/input_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.purple100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 48),

              /// Title
              Text(
                "로그인하기",
                style: AppTextStyles.headerBold(color: ColorStyles.purple900),
              ),

              const SizedBox(height: 8),

              /// Subtitle
              Text(
                "이메일과 비밀번호를 입력해주세요",
                style: AppTextStyles.mediumRegular(
                  color: ColorStyles.purple900,
                ),
              ),

              const SizedBox(height: 32),

              /// Email Field
              InputField(hintText: '이메일을 입력해주세요', placeHolder: '', value: ''),
              const SizedBox(height: 16),

              /// Password Field
              InputField(
                hintText: '비밀번호를 입력해주세요',
                placeHolder: '',
                value: '',
                isPassword: true,
              ),

              const SizedBox(height: 16),

              /// Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // 비밀번호 찾기
                  },
                  child: Text(
                    '비밀번호를 잊으셨나요?',
                    style: AppTextStyles.mediumBold(
                      color: ColorStyles.purple900,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// Login Button
              Buttons(
                text: '로그인',
                btnColor: ColorStyles.purple900,
                textColor: ColorStyles.white,
                onPressed: () {
                  // 로그인 처리
                },
              ),

              const SizedBox(height: 32),

              /// Sign Up Text
              GestureDetector(
                onTap: () {
                  // 회원가입 화면으로 이동
                },
                child: RichText(
                  text: TextSpan(
                    text: "계정이 없으신가요? ",
                    style: AppTextStyles.mediumBold(
                      color: ColorStyles.purple900,
                    ),
                    children: [
                      TextSpan(
                        text: "회원가입하기",
                        style: AppTextStyles.mediumBold(
                          color: ColorStyles.purple900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
