import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mawhibty/constants/colors.dart';
import 'package:mawhibty/widgets/back_button_widget.dart';
import 'package:mawhibty/widgets/elevated_button_widget.dart';
import 'package:mawhibty/widgets/rating_widget.dart';

class TodaysPicksScreen extends StatelessWidget {
  const TodaysPicksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اختياراتنا ليك النهارده!'),
        leading: const CustomBackButtonWidget(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Expanded(
                    child: Text(
                      'اختياراتنا ليك النهارده!',
                      style: TextStyle(
                          fontSize: 24,
                          color: primaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.separated(
                itemBuilder: (context, index) => buildPlayerCard(context),
                itemCount: 10,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildPlayerCard(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(
      horizontal: screenWidth * 0.03,
      vertical: screenHeight * 0.015,
    ),
    margin: EdgeInsets.only(bottom: screenHeight * 0.015),
    decoration: BoxDecoration(
      color: containerColor,
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage('assets/icons/avatar.jpg'),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'كريم محمد',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  color: primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const RatingWidget(rate: 3),
          ],
        ),
        SizedBox(height: screenHeight * 0.015),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/ball.svg',
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 10),
            Text(
              'كرة القدم | مهاجم',
              style: TextStyle(
                fontSize: screenWidth * 0.038,
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.01),
        Row(
          children: [
            SvgPicture.asset('assets/icons/done.svg', height: 24, width: 24),
            const SizedBox(width: 5),
            Text(
              '3',
              style: TextStyle(
                fontSize: screenWidth * 0.032,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 3),
            Text(
              'مهمات مكتملة',
              style: TextStyle(
                fontSize: screenWidth * 0.032,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.005),
        Row(
          children: [
            SvgPicture.asset('assets/icons/video.svg', height: 24, width: 24),
            const SizedBox(width: 5),
            Text(
              '3',
              style: TextStyle(
                fontSize: screenWidth * 0.032,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 3),
            Text(
              'فيديوهات مرفوعة',
              style: TextStyle(
                fontSize: screenWidth * 0.032,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.005),
        Row(
          children: [
            SvgPicture.asset('assets/icons/gallery.svg', height: 24, width: 24),
            const SizedBox(width: 5),
            Text(
              '3',
              style: TextStyle(
                fontSize: screenWidth * 0.032,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 3),
            Text(
              'صور مرفوعة',
              style: TextStyle(
                fontSize: screenWidth * 0.032,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              onPressed: () {},
              buttonText: 'ابدأ المفاوضات',
              buttonHeight: 37,
              buttonWidth: screenWidth * 0.4,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.04,
              ),
            ),
            SizedBox(width: screenWidth * 0.05),
            CustomElevatedButton(
              onPressed: () {},
              buttonText: 'المزيد',
              buttonWidth: screenWidth * 0.4,
              buttonHeight: 38,
              buttonColor: Colors.transparent,
              shadowColor: Colors.transparent,
              borderColor: primaryColor,
              textStyle: TextStyle(
                color: primaryColor,
                fontSize: screenWidth * 0.04,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
