import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mawhibty/constants/colors.dart';
import 'package:mawhibty/player/views/screens/tasks_screen.dart';

class Level {
  final String name;
  final bool isLocked;
  final int stars;

  Level({required this.name, required this.isLocked, this.stars = 0});
}

class PlayerHomeScreen extends StatelessWidget {
  PlayerHomeScreen({super.key});

  final List<Level> levels = [
    Level(name: '1', isLocked: false, stars: 2),
    Level(name: '2', isLocked: false, stars: 3),
    Level(name: '3', isLocked: false, stars: 1),
    Level(name: '4', isLocked: true),
    Level(name: '5', isLocked: true),
    Level(name: '6', isLocked: true),
    Level(name: '7', isLocked: true),
    Level(name: '8', isLocked: true),
    Level(name: '9', isLocked: true),
    Level(name: '10', isLocked: true),
    Level(name: '11', isLocked: true),
    Level(name: '12', isLocked: true),
    Level(name: '13', isLocked: true),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 3;
    if (screenWidth >= 600) {
      crossAxisCount = 4;
    } else if (screenWidth >= 900) {
      crossAxisCount = 5;
    }

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: primaryColor,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'مستواك الحالي:  Level 3 – صاعد سريعًا!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: levels.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final level = levels[index];
                  return level.isLocked
                      ? buildLevelLockedContainer(level.name)
                      : InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TasksScreen()));
                          },
                          child: buildLevelContainer(level.stars));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildLevelContainer(int stars) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      image: const DecorationImage(
        image: AssetImage('assets/images/avatar.jpg'),
        fit: BoxFit.fill,
      ),
    ),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 3; i++)
              Icon(
                i < stars ? Icons.star : Icons.star_border,
                color: primaryColor,
                size: 18,
              ),
          ],
        ),
      ),
    ),
  );
}

Widget buildLevelLockedContainer(String level) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: containerColor,
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/lock.svg',
            width: 32,
            height: 32,
          ),
          const SizedBox(height: 8),
          Text(
            level,
            style: const TextStyle(
              color: Color.fromRGBO(196, 196, 196, 1),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    ),
  );
}
