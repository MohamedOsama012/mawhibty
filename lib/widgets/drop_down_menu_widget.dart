import 'package:flutter/material.dart';
import 'package:mawhibty/constants/colors.dart';

class DropDownMenuWidget extends StatelessWidget {
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String labelText;
  final IconData? prefixIcon;
  final Color borderColor;
  final String? Function(String?)? validator;

  const DropDownMenuWidget(
      {super.key,
      required this.options,
      required this.selectedValue,
      required this.onChanged,
      this.labelText = 'Select an option',
      this.prefixIcon,
      required this.borderColor,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
            color: Color.fromRGBO(113, 113, 113, 1), fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: borderColor, width: 3),
        ),
      ),
      value: selectedValue,
      validator: validator,
      items: options
          .map(
            (option) => DropdownMenuItem(
              value: option,
              child: Text(option),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
