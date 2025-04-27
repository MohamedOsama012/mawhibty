import 'package:flutter/material.dart';
import 'package:mawhibty/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final Color borderColor;
  final double borderWidth;
  final double radius;
  final bool isPassword;
  final Widget? suffix;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final bool readOnly;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.borderColor = primaryColor,
    this.borderWidth = 3.0,
    this.radius = 32.0,
    this.isPassword = false,
    this.suffix,
    this.prefix,
    this.onTap,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        cursorColor: primaryColor,
        validator: validator,
        onTap: onTap,
        readOnly: readOnly,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffix,
          prefixIcon: prefix,
          hintStyle: const TextStyle(
            color: Color.fromRGBO(113, 113, 113, 1),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: borderColor,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
