import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mawhibty/constants/colors.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double iconSize = MediaQuery.of(context).size.width * 0.07;

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navBarIcon('assets/icons/home.svg', 0, iconSize),
            navBarIcon('assets/icons/chat.svg', 1, iconSize),
            navBarIcon('assets/icons/user.svg', 2, iconSize),
            navBarIcon('assets/icons/task.svg', 3, iconSize),
          ],
        ),
      ),
    );
  }

  Widget navBarIcon(String assetPath, int index, double size) {
    return IconButton(
      onPressed: () => onTap(index),
      icon: SvgPicture.asset(
        assetPath,
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(
          selectedIndex == index ? Colors.white : Colors.white60,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
