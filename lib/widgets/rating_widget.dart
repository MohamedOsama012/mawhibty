import 'package:flutter/material.dart';
import 'package:mawhibty/constants/colors.dart';

class RatingWidget extends StatelessWidget {
  final int? stars;
  final int rate;
  const RatingWidget({super.key, this.stars = 5, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < stars!; i++)
          i < rate
              ? const Icon(Icons.star, color: primaryColor)
              : const Icon(Icons.star_border, color: primaryColor),
      ],
    );
  }
}
