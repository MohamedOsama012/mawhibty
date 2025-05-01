import 'package:flutter/material.dart';
import 'package:mawhibty/constants/colors.dart';
import 'package:mawhibty/widgets/back_button_widget.dart';
import 'package:mawhibty/widgets/rating_widget.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenWidth = media.size.width;

    final double iconSize = screenWidth * 0.07;
    final double fontSize = screenWidth * 0.05;
    final double avatarRadius = screenWidth * 0.06;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBackButtonWidget(),
        title: Text(
          'مهام المستوى 3',
          style: TextStyle(fontSize: fontSize),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Container(
              height: screenWidth * 0.18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.06),
                color: primaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'مستواك الحالي:  Level 3 – صاعد سريعًا!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              itemCount: 10,
              itemBuilder: (context, index) => buildTaskCard(screenWidth),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildTaskCard(double screenWidth) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
        color: containerColor,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'ارفع فيديو بتشوط الكورة',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(241, 247, 235, 1),
                  borderRadius: BorderRadius.circular(screenWidth * 0.025),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.025,
                  vertical: screenWidth * 0.015,
                ),
                child: Row(
                  children: [
                    Icon(Icons.check,
                        color: Colors.green, size: screenWidth * 0.04),
                    SizedBox(width: screenWidth * 0.01),
                    Text(
                      'مُنجزة بنجاح',
                      style: TextStyle(fontSize: screenWidth * 0.035),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: screenWidth * 0.02),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'ورينا تسديدتك الجامدة!',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: primaryTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.03),
          const RatingWidget(
            stars: 3,
            rate: 2,
          ),
        ],
      ),
    ),
  );
}
