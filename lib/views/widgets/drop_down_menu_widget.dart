import 'package:flutter/material.dart';

class DropDownMenuWidget extends StatelessWidget {
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String labelText;
  final IconData? prefixIcon;
  final Color borderColor;

  const DropDownMenuWidget({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    this.labelText = 'Select an option',
    this.prefixIcon,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: labelText,
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
