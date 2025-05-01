// lib/presentation/component/custom_text_field.dart
import 'package:flutter/material.dart';
import 'package:tadaktak_app/core/styles/app_text_styles.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';

class InputField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final bool autofocus;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final String? errorText; // 추가: 에러 텍스트 직접 표시 옵션

  const InputField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines,
    this.autofocus = false,
    this.focusNode,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.errorText, // 추가
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 라벨
        Text(label, style: AppTextStyles.mediumBold(color: ColorStyles.black)),
        const SizedBox(height: 8),

        // 텍스트 필드
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          validator: validator,
          maxLines: maxLines,
          minLines: minLines,
          autofocus: autofocus,
          focusNode: focusNode,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onSubmitted,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.normalRegular(color: ColorStyles.gray400),
            filled: true,
            fillColor: ColorStyles.purple200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            suffixIcon: suffixIcon,
            errorText: errorText, // validator가 아닌 직접 에러 텍스트 표시
            errorStyle: AppTextStyles.smallRegular(color: ColorStyles.red100),
          ),
        ),
      ],
    );
  }
}

// 비밀번호 필드를 위한 확장 컴포넌트
class PasswordTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final bool isPasswordVisible;
  final VoidCallback togglePasswordVisibility;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged; // 추가: 텍스트 변경 콜백
  final String? errorText; // 추가: 에러 텍스트

  const PasswordTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.isPasswordVisible,
    required this.togglePasswordVisibility,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.focusNode,
    this.onSubmitted,
    this.onChanged, // 추가
    this.errorText, // 추가
  });

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: label,
      hintText: hintText,
      controller: controller,
      keyboardType: TextInputType.text,
      textInputAction: textInputAction,
      obscureText: !isPasswordVisible,
      validator: validator,
      focusNode: focusNode,
      onSubmitted: onSubmitted,
      onChanged: onChanged, // 추가: 콜백 전달
      errorText: errorText, // 추가: 에러 텍스트 전달
      suffixIcon: IconButton(
        icon: Icon(
          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          color: ColorStyles.gray400,
        ),
        onPressed: togglePasswordVisibility,
      ),
    );
  }
}
