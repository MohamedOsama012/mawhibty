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

  const CustomElevatedButton({
    super.key,
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
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.04),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: Size(buttonWidth, buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: textStyle,
        ),
      ),
    );
  }
}
