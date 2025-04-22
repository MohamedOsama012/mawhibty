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
      'title': 'رحلتك بدأت... ورينا عضلاتك!',
      'desc': 'كل مستوى تفتحه بيقرّبك من حلمك!\nيلا ورينا لمستك السحرية'
    },
    {
      'image': 'assets/images/onboarding2.jpg',
      'title': 'المهارة مش كلام... إثبتها!',
      'desc': 'صور نفسك، ارفع الفيديو، وخلي الكورة\n تتكلم عنك',
    },
    {
      'image': 'assets/images/onboarding3.jpg',
      'title': 'ليفل جديد؟ نجمة جديدة؟ يلا بينا!',
      'desc': 'كل ما تكمّل مهمة، تكسب نجمة...\n وسكة الاحتراف بتقرب',
    }
  ];

  void _onDone() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
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
          fit: BoxFit.contain,
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('موهبتي'),
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
                  isLastPage = index == onboardingData.length - 1;
                });
              },
              itemBuilder: (_, index) => _buildPageContent(
                  onboardingData[index], screenWidth, screenHeight),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.04),
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        ],
      ),
    );
  }
}
