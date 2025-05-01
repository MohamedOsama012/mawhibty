import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mawhibty/constants/colors.dart';
import 'package:mawhibty/organization/views/screens/order_player_screen.dart';
import 'package:mawhibty/organization/views/screens/todays_picks_screen.dart';

class OrganizationLayout extends StatelessWidget {
  const OrganizationLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double horizontalPadding = screenWidth * 0.05;
    final double verticalPadding = screenHeight * 0.03;
    final double containerHeight = screenHeight * 0.33;
    final double iconSize = screenWidth * 0.08;
    final double fontSize = screenWidth * 0.06;
    final double imageSize = screenWidth * 0.25;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: 5.0),
          child: InkWell(
            onTap: () {},
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/icons/avatar.jpg'),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_sharp,
              size: iconSize,
            ),
            onPressed: () {},
          ),
        ],
        title: Text(
          'اصطاد نجمك القادم',
          style: TextStyle(fontSize: fontSize),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsetsDirectional.only(
              start: horizontalPadding,
              end: horizontalPadding,
              top: verticalPadding,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrderPlayerScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: containerHeight,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: containerColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.mail,
                                  color: primaryColor, size: iconSize),
                              const SizedBox(width: 10),
                              Text(
                                'طلب لعيب',
                                style: TextStyle(
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.w500,
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: containerHeight * 0.2),
                          SvgPicture.asset(
                            'assets/icons/shaking.svg',
                            height: imageSize,
                            width: imageSize,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TodaysPicksScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: containerHeight,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: containerColor,
                      ),
                      child: Column(
                        children: [
                          const Spacer(flex: 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/target.png',
                                  height: iconSize + 5),
                              const SizedBox(width: 10),
                              Text(
                                'اختياراتنا ليك النهارده!',
                                style: TextStyle(
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.w500,
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(flex: 1),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: SvgPicture.asset(
                                'assets/icons/football.svg',
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
