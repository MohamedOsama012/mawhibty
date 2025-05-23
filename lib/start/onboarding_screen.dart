import 'package:flutter/material.dart';
import 'package:mawhibty/constants/colors.dart';
import 'package:mawhibty/generated/l10n.dart';
import 'package:mawhibty/auth/screens/login_screen.dart';
import 'package:mawhibty/widgets/back_button_widget.dart';
import 'package:mawhibty/widgets/elevated_button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  bool isLastPage = false;
  int currentPage = 0;

  List<Map<String, String>> _getOnboardingData(BuildContext context) {
    final loc = S.of(context);
    return [
      {
        'image': 'assets/images/onboarding1.jpg',
        'title': loc.onboardingTitle1,
        'desc': loc.onboardingDesc1,
      },
      {
        'image': 'assets/images/onboarding2.jpg',
        'title': loc.onboardingTitle2,
        'desc': loc.onboardingDesc2,
      },
      {
        'image': 'assets/images/onboarding3.jpg',
        'title': loc.onboardingTitle3,
        'desc': loc.onboardingDesc3,
      }
    ];
  }

  Widget _buildPageContent(
      Map<String, String> data, double screenWidth, double screenHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          data['image']!,
          height: screenHeight * 0.35,
          width: screenWidth * 0.7,
          fit: BoxFit.fill,
        ),
        SizedBox(height: screenHeight * 0.05),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          child: Text(
            data['title']!,
            style: const TextStyle(
              fontSize: 24,
              color: primaryColor,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: screenHeight * 0.03),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Text(
            data['desc']!,
            style: TextStyle(
              fontSize: screenWidth * 0.045,
              color: secondaryTextColor,
              height: 1.5,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final onboardingData = _getOnboardingData(context);
    final loc = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.appTitle),
        leading: currentPage != 0
            ? CustomBackButtonWidget(
                onPressed: () {
                  controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              )
            : null,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: onboardingData.length,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                  isLastPage = index == onboardingData.length - 1;
                });
              },
              itemBuilder: (_, index) => _buildPageContent(
                  onboardingData[index], screenWidth, screenHeight),
            ),
          ),
          CustomElevatedButton(
            borderRadius: 24,
            onPressed: () {
              if (isLastPage) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false);
              } else {
                controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            buttonText: isLastPage ? loc.start : loc.next,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.09),
        ],
      ),
    );
  }
}
