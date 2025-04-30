import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mawhibty/generated/l10n.dart';

String? validateEmail(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return S.of(context).email_required;
  }
  String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return S.of(context).email_invalid;
  }
  return null;
}

String? validatePassword(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return S.of(context).password_required;
  }
  if (value.length < 8) {
    return S.of(context).password_short;
  }
  return null;
}

String? validateName(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return S.of(context).name_required;
  }
  if (value.length < 3) {
    return S.of(context).name_short;
  }
  return null;
}

String? validatePhone(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return S.of(context).phoneNumberRequired;
  }

  final phoneRegExp = RegExp(r'^01[0-2,5][0-9]{8}$');

  if (!phoneRegExp.hasMatch(value)) {
    return S.of(context).phoneNumberInvalid;
  }

  return null;
}

// Date validation function
String? validateDate(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return S.of(context).birthDateRequired;
  }
  try {
    DateTime parsedDate = DateFormat('yyyy-MM-dd').parseStrict(value);
    if (parsedDate.isAfter(DateTime.now())) {
      return S.of(context).birthDateFuture;
    }
  } catch (e) {
    return S.of(context).birthDateInvalid;
  }
  return null;
}
