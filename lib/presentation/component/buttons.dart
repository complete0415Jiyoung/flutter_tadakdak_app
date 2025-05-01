import 'package:flutter/material.dart';
import 'package:tadaktak_app/core/styles/app_text_styles.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';

enum ButtonSize { big, medium, small }

class Buttons extends StatefulWidget {
  final String text;
  final ButtonSize size;
  final VoidCallback? onPressed;
  final bool isDisabled;
  final IconData? icon;
  final bool isPressed;
  final Color? btnColor;
  final Color? textColor;
  final bool isLoading; // 추가된 isLoading 매개변수

  const Buttons({
    super.key,
    required this.text,
    required this.onPressed,
    this.size = ButtonSize.medium,
    this.isDisabled = false,
    this.icon,
    this.isPressed = false,
    this.btnColor = ColorStyles.purple300,
    this.textColor = ColorStyles.gray50,
    this.isLoading = false, // 기본값 false
  });

  _ButtonStyleInfo _getStyle(ButtonSize size, Color textColor) {
    switch (size) {
      case ButtonSize.big:
        return _ButtonStyleInfo(
          height: 60,
          radius: 10,
          textStyle: AppTextStyles.normalBold(color: textColor),
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 85),
        );
      case ButtonSize.medium:
        return _ButtonStyleInfo(
          height: 54,
          radius: 10,
          textStyle: AppTextStyles.normalBold(color: textColor),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        );
      case ButtonSize.small:
        return _ButtonStyleInfo(
          height: 37,
          radius: 10,
          textStyle: AppTextStyles.smallBold(color: textColor),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        );
    }
  }

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    final style = widget._getStyle(widget.size, widget.textColor!);

    double screenWidth = MediaQuery.of(context).size.width;
    final showIcon =
        (widget.size == ButtonSize.big || widget.size == ButtonSize.medium);
    double buttonWidth;
    switch (widget.size) {
      case ButtonSize.big:
        buttonWidth = double.infinity;
        break;
      case ButtonSize.medium:
        buttonWidth = screenWidth * 0.70;
        break;
      case ButtonSize.small:
        buttonWidth = screenWidth * 0.50;
        break;
    }

    final Color backgroundColor =
        widget.isDisabled ||
                widget
                    .isLoading // isLoading 상태도 비활성화 배경색 적용
            ? ColorStyles.gray4
            : _isPressed
            ? ColorStyles.gray4
            : widget.btnColor ?? ColorStyles.purple100;

    return GestureDetector(
      onTap:
          (widget.isDisabled || widget.isLoading) // isLoading 중에는 탭 비활성화
              ? null
              : widget.onPressed,
      onTapDown: (_) {
        if (!widget.isDisabled && !widget.isLoading) {
          // isLoading 체크 추가
          setState(() {
            _isPressed = true;
          });
        }
      },
      onTapUp: (_) {
        if (!widget.isDisabled && !widget.isLoading) {
          // isLoading 체크 추가
          setState(() {
            _isPressed = false;
          });
        }
      },
      onTapCancel: () {
        if (!widget.isDisabled && !widget.isLoading) {
          // isLoading 체크 추가
          setState(() {
            _isPressed = false;
          });
        }
      },
      child: Container(
        width: buttonWidth, // 반응형
        height: style.height,
        padding: style.padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(style.radius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // isLoading 상태일 때는 로딩 인디케이터 표시, 아닐 때는 기존 내용 표시
            if (widget.isLoading)
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(widget.textColor!),
                ),
              )
            else ...[
              if (showIcon && widget.icon != null) ...[
                Icon(widget.icon, color: widget.textColor, size: 20),
                const SizedBox(width: 11),
              ],
              Text(
                widget.text,
                style: style.textStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ButtonStyleInfo {
  final double height;
  final double radius;
  final TextStyle textStyle;
  final EdgeInsets padding;

  const _ButtonStyleInfo({
    required this.height,
    required this.radius,
    required this.textStyle,
    required this.padding,
  });
}
