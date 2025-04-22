import 'package:flutter/material.dart';
import 'package:mawhibty/constants/colors.dart';
import 'package:mawhibty/views/auth/screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  bool isLastPage = false;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/onboarding1.jpg',
      'title': 'مرحباً بك في موهبتي',
      'desc': 'منصة لاكتشاف وتنمية مهارات ومواهب الأطفال'
    },
    {
      'image': 'assets/images/onboarding2.jpg',
      'title': 'تابع تقدم طفلك',
      'desc': 'يمكنك متابعة أداء وتقدم طفلك في الأنشطة المختلفة'
    },
    {
      'image': 'assets/images/onboarding3.jpg',
      'title': 'ابدأ الآن',
      'desc': 'سجّل الآن وابدأ في رحلة تطوير مهارات طفلك'
    },
  ];

  void _onDone() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  Widget _buildPageContent(Map<String, String> data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(data['image']!, height: 250),
        const SizedBox(height: 30),
        Text(
          data['title']!,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            data['desc']!,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('موهبتي'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == onboardingData.length - 1;
                });
              },
              itemBuilder: (_, index) =>
                  _buildPageContent(onboardingData[index]),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding:
                const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 80.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: const Size(328, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  if (isLastPage) {
                    _onDone();
                  } else {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(
                  isLastPage ? 'ابدأ' : 'التالي',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
