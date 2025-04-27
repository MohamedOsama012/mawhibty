import 'package:flutter/material.dart';
import 'package:mawhibty/constants/colors.dart';

class CustomBackButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomBackButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: MediaQuery.of(context).size.width * 0.04,
      ),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: const Color.fromRGBO(251, 248, 236, 1),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: primaryColor,
            size: 20,
          ),
          onPressed: onPressed ?? () => Navigator.pop(context),
        ),
      ),
    );
  }
}
