import 'package:flutter/material.dart';
import 'package:mawhibty/constants/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color buttonColor;
  final double borderRadius;
  final double buttonHeight;
  final double buttonWidth;
  final TextStyle textStyle;
  final Color? borderColor;
  final Color? shadowColor;

  const CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      this.buttonColor = primaryColor,
      this.borderRadius = 32.0,
      this.buttonHeight = 56.0,
      this.buttonWidth = 328.0,
      this.textStyle = const TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      this.borderColor,
      this.shadowColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shadowColor: shadowColor,
        minimumSize: Size(buttonWidth, buttonHeight),
        side: BorderSide(color: borderColor ?? Colors.transparent),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}
