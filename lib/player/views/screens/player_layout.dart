import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawhibty/controller/cubit/app/app_cubit.dart';
import 'package:mawhibty/controller/cubit/app/app_states.dart';
import 'package:mawhibty/widgets/bottom_nav_bar_widget.dart';

class PlayerLayout extends StatelessWidget {
  const PlayerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = AppCubit.get(context);
        final media = MediaQuery.of(context);
        final screenWidth = media.size.width;
        final screenHeight = media.size.height;

        final double iconSize = screenWidth * 0.07;
        final double fontSize = screenWidth * 0.05;
        final double avatarRadius = screenWidth * 0.06;

        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            leading: Padding(
              padding: EdgeInsetsDirectional.only(start: screenWidth * 0.01),
              child: InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: avatarRadius,
                  backgroundImage: const AssetImage('assets/icons/avatar.jpg'),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications_sharp, size: iconSize),
                onPressed: () {},
              ),
            ],
            title: Text(
              'أهلاً، يا نجم الملاعب!',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: CustomNavBar(
            selectedIndex: cubit.currentIndex,
            onTap: (index) => cubit.changeBottomNav(index),
          ),
        );
      },
    );
  }
}
