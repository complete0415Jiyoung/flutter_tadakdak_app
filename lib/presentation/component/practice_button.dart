import 'package:flutter/material.dart';

class PracticeButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final double iconSize;
  final VoidCallback onClick;

  const PracticeButton({
    super.key,
    required this.text,
    required this.icon,
    required this.iconSize,
    required this.onClick,
  });

  @override
  State<PracticeButton> createState() => _PracticeButtonState();
}

class _PracticeButtonState extends State<PracticeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClick();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFB39DDB),
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          // 여기서 boxShadow 추가
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08), // 그림자 색상(투명도 조절)
              spreadRadius: 0.6, // 그림자 번짐 정도
              blurRadius: 6, // 그림자 흐림 정도
              offset: Offset(1, 1), // 그림자의 위치 (x, y)
            ),
          ],
        ),
        height: 72,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: CircleAvatar(
                backgroundColor: Color(0xffE9E7FD),
                radius: 22,
                child: Icon(
                  widget.icon,
                  color: Color(0xFF7669F1),
                  size: widget.iconSize,
                ),
              ),
            ),
            Expanded(
              child: Text(
                widget.text,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Icon(
                Icons.play_arrow_rounded,
                color: Color(0xFF7669F1),
                size: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
