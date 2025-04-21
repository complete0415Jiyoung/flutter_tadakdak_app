import 'package:flutter/material.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final String placeHolder;
  final String value;
  final IconData? icon;
  final bool isDisabled;
  final bool isPassword;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function()? onSubmit;

  const InputField({
    super.key,
    required this.hintText,
    required this.placeHolder,
    required this.value,
    this.icon,
    this.isDisabled = false,
    this.isPassword = false,
    this.onChanged,
    this.onTap,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: value);

    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: ColorStyles.purple200,
        borderRadius: BorderRadius.circular(28), // 둥글게
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              enabled: !isDisabled,
              onChanged: onChanged,
              onTap: onTap,
              onSubmitted: (value) {
                if (onSubmit != null) {
                  onSubmit!();
                }
              },
              style: const TextStyle(
                color: ColorStyles.purple900, // 텍스트 색상
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: ColorStyles.purple500, // placeholder 색상
                  fontSize: 16,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          if (icon != null) Icon(icon, color: ColorStyles.purple500, size: 20),
        ],
      ),
    );
  }
}
